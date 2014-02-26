# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    name "MyString"
    size "MyString"
    price "MyString"
    frequency "MyString"
    plan "MyString"
    price "MyString"
    promocode "MyString"
    firstname "MyString"
    lastname "MyString"
    address "MyString"
    apt "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    stripetoken "MyString"
    user_id 1
  end
end
