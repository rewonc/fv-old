# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :box do
    firstname "MyString"
    lastname "MyString"
    email "MyString"
    phone "MyString"
    frequency 1
    delivery_preference 1
    street "MyString"
    street2 "MyString"
    city "MyString"
    state "MyString"
    zip "MyString"
    instructions "MyString"
  end
end
