# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :truck do
    sequence :name do |n|
      "Grilled Cheese Experience #{n}"
    end
    kind "Sandwiches"
    description "Seriously Awesome Grilled Cheese Sandwiches and Homemade Organic Soups!"
    twitter "https://twitter.com/wheelsofcheesxp"
    facebook "https://www.facebook.com/pages/The-Grilled-Cheese-Experience/295109703918718"
    website ""
    accepts_cards true
  end
end
