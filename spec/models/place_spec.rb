require 'spec_helper'

describe Place do
  it "should require a title and state" do
  	FactoryGirl.build(:place, title: nil).should_not be_valid
  	FactoryGirl.build(:place, state: nil).should_not be_valid
  end
end