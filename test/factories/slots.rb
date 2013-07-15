# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :slot do
    truck
    weekday "Monday"
    address "2121 6th Ave"
    neighborhood "South Lake Union"
    period "11AM-1PM"
  end
end
