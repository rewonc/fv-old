# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :interval_pickup do
    product_interval nil
    pickup nil
    processing_time 1
    charge 1
    charge1 1
    charge2 1
  end
end
