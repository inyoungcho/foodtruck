# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

scraper = Scrape::Scraper.new
scraper.import!
# Correct some bad data
Slot.find_by_neighborhood('5 pm. – 8 pm.').update_attributes(neighborhood: 'Columbia City')
Slot.find_by_neighborhood('Downtown seattle').update_attributes(neighborhood: 'Downtown Seattle')
Slot.find_by_neighborhood('SLU').try(:destroy)