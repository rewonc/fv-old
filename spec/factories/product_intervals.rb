# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_interval do
    product nil
    quantity 1
    base_price "9.99"
    time_start "2013-10-04 12:05:59"
    time_end "2013-10-04 12:05:59"
    attributes "MyString"
  end
end
