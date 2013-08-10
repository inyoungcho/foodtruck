desc "Scrape seattlefoodtruck.com"
task :scrape, [:import] => :environment do |task, args|
  scraper = Scrape::Scraper.new

  if args.import
    scraper.import!
  else
    scraper.preview
  end
end
