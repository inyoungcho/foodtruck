module Scrape
  class Scraper
    SOURCE = "http://www.seattlefoodtruck.com/index.php/trucks/"

    attr_reader :mechanize_options

    def mechanize_options= mechanize_options
      @mechanize_options = mechanize_options
      @mechanize = Mechanize.new mechanize_options
    end

    def initialize
      @mechanize = Mechanize.new
    end

    def preview
      @results ||= fetch
      puts "Inspect @results to see what would be imported"
      binding.pry
    end

    def import!
      @results ||= fetch

      # Remove stale slots and trucks
      Truck.destroy_all
      Slot.destroy_all 
      
      # Import the new stuff
      @results.each do |result|
        begin
          Truck.transaction do
            result[:truck].save
            result[:slots].each { |s| s.truck = result[:truck]; s.save }
          end
        rescue => e
          $stderr.puts "Error saving truck to database: #{e}"
        end
      end
    end

    private
      def scrape_slots page
        slots = []
        slot = nil
        page.parser.css('div#content table')[1].css('td').each_with_index do |td, index|
          if index.even?
            slot = Slot.new
            slot.weekday = td.text.chomp(":\n")
            break unless JunkDrawer::Weekdays.weekdays.include?(slot.weekday)
          else
            # fuck me
            slot.neighborhood = td.css('strong').text.strip
            raw_text = td.text.strip.split(slot.neighborhood, 2).last
            slot.period = raw_text.split(",").last.strip
            slot.address = raw_text.split(", #{slot.period}").first.strip
            slots << slot
          end
        end
        slots
      end

      def fetch_truck link
        truck = Truck.new
        slots = []
        @mechanize.transact do
          truck_page = @mechanize.click link
          truck.name = truck_page.parser.css('div#content h1.entry-title').text
          truck.kind = truck_page.parser.css('div#content table')[0].css('td')[1].text.strip
          truck.description = truck_page.parser.css('div#content table')[0].css('td')[5].text.strip

          truck.facebook = truck_page.parser.css('div#content table')[2].css('td')[1].try(:text).try(:strip)
          truck.twitter = truck_page.parser.css('div#content table')[2].css('td')[3].try(:text).try(:strip)
          truck.website = truck_page.parser.css('div#content table')[2].css('td')[5].try(:text).try(:strip)

          payment =  truck_page.parser.css('div#content table')[0].css('td')[3].text.strip
          truck.accepts_cards = payment.downcase.include?('card')

          slots =  scrape_slots(truck_page)
        end # end transact
        { truck: truck, slots: slots }
      end

      def fetch
        results = []
        @mechanize.get(SOURCE) do |trucks_page|
          trucks_page.parser.css('div.entry-content table tr td a').each do |link|
            # Pull each truck and its slots
            begin
              results << fetch_truck(link)
            rescue => e
              $stderr.puts "Error fetching page #{link}, #{e.message}"
            end
          end # end do |link|
        end # end @mechanize.get
        results
      end

  end
end