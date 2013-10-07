require 'spec_helper'

describe Place do

  #validations
  it "has a valid factory" do
    FactoryGirl.create(:place).should be_valid
  end

  it "should require a title and state" do
  	FactoryGirl.build(:place, title: nil).should_not be_valid
  	FactoryGirl.build(:place, state: nil).should_not be_valid
  end

  #parents and children
  it "should return all the products it has" do
  	FactoryGirl.build(:place).products.should_not be_nil
  end

  it "should return all the pickups it has" do
  	FactoryGirl.build(:place).pickups.should_not be_nil
  end


end
