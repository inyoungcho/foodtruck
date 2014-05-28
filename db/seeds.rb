# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Truck.select(:kind).distinct.to_a.map { |t| t.kind }.sort
# Slot.select(:neighborhood).distinct.to_a.map { |s| s.neighborhood }.sort

scraper = Scrape::Scraper.new
scraper.import!

# Correct some bad data
Slot.find_by_neighborhood('Downtown seattle').try(:update_attributes, neighborhood: 'Downtown Seattle')
Slot.find_by_neighborhood('SLU').try(:destroy)
Slot.find_by_neighborhood('Downtown Seasttle').try(:update_attributes, neighborhood: 'Downtown Seattle')
Slot.find_by_neighborhood('South lake Union').try(:update_attributes, neighborhood: 'South Lake Union')
Slot.find_by_neighborhood('Queen ANne').try(:update_attributes, neighborhood: 'Queen Anne')
Slot.find_by_neighborhood('U District').try(:update_attributes, neighborhood: 'University District')
Slot.find_by_neighborhood('Remond').try(:update_attributes, neighborhood: 'Redmond')
Truck.find_by_kind('comfort food').try(:destroy)
Truck.find_by_kind('Indonedian').try(:update_attributes, kind: 'Indonesian')
Truck.find_by_kind('Sweets (closed for winter)').try(:destroy)
Truck.find_by_kind('Korean (closed for winter)').try(:destroy)
Truck.find_by_kind('Hot Dogs (closed for winter)').try(:destroy)
Truck.find_by_kind('Gluten-free American – Coming Soon!').try(:destroy)
