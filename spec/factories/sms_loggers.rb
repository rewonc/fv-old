# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sms_logger do
    body "MyString"
    from "MyString"
  end
end
