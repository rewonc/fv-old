require 'spec_helper'

describe Pickup do
  
	it "should not save without its proper fields" do
		FactoryGirl.build(:pickup, farm_id: nil).should_not be_valid
		FactoryGirl.build(:pickup, place_id: nil).should_not be_valid
		FactoryGirl.build(:pickup, address: nil).should_not be_valid
		FactoryGirl.build(:pickup, zip: nil).should_not be_valid
	end

	it "should have a valid zip" do
		FactoryGirl.build(:pickup, zip: "abcde").should_not be_valid
		FactoryGirl.build(:pickup, zip: "109232").should_not be_valid
		FactoryGirl.build(:pickup, zip: "1111").should_not be_valid
		FactoryGirl.build(:pickup, zip: "12345").should be_valid
	end


	it "should have valid geocoordinates (a la googlemaps)"

end
