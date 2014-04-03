# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :delivery do
    shipping_date "2014-04-03"
    active false
    order nil
  end
end
