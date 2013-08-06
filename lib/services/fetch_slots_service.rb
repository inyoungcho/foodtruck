module Services
  class FetchSlotsService

    def call options = {}
      # If the weekday is specified, fetch for that weekday
      # If no weekday is specified and :fetch_all is not set, fetch for today
      # If no weekday is specified and :fetch_all is set, fetch all slots
      weekday = options[:weekday]
      weekday ||= JunkDrawer::Weekdays.current_weekday unless options[:fetch_all]

      # Filter for weekday if one was set
      query = Slot.available_on(weekday) if weekday.present?
      query ||= Slot.all

      query.tap do
        query.joins!(:truck).includes!(:truck)
        query.merge!(Truck.of_kind(options[:kind])) if options.has_key?(:kind)
        query.merge!(Slot.in_neighborhood(options[:neighborhood])) if options.has_key?(:neighborhood)
      end
    end

  end
end