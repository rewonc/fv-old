require 'spec_helper'

describe Farmer do

	#validations
  it "should validate firstname, lastname, and age" do
  	FactoryGirl.build(:farmer, first_name: nil).should_not be_valid
  	FactoryGirl.build(:farmer, last_name: nil).should_not be_valid
  	FactoryGirl.build(:farmer, age: nil).should_not be_valid
  	FactoryGirl.build(:farmer, age: "string").should_not be_valid
  	FactoryGirl.build(:farmer, age: 0).should_not be_valid
  	FactoryGirl.build(:farmer, age: 25).should be_valid
  end
end
