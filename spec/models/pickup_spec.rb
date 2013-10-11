require 'spec_helper'

describe Pickup do
  
  #validations
  	it "should have a valid factory" do
  		FactoryGirl.build(:pickup).should be_valid
  	end

	it "should not save without its proper fields" do
		FactoryGirl.build(:pickup, farm_id: nil).should_not be_valid
		FactoryGirl.build(:pickup, place_id: nil).should_not be_valid
		FactoryGirl.build(:pickup, address: nil).should_not be_valid
		FactoryGirl.build(:pickup, zip: nil).should_not be_valid
		FactoryGirl.build(:pickup, period: nil).should_not be_valid
		FactoryGirl.build(:pickup, latitude: nil).should_not be_valid
		FactoryGirl.build(:pickup, longitude: nil).should_not be_valid
	end

	it "should have a valid zip" do
		FactoryGirl.build(:pickup, zip: "abcde").should_not be_valid
		FactoryGirl.build(:pickup, zip: "109232").should_not be_valid
		FactoryGirl.build(:pickup, zip: "1111").should_not be_valid
		FactoryGirl.build(:pickup, zip: "12345").should be_valid
		FactoryGirl.build(:pickup, zip: "12345-8982").should be_valid
	end

	it "should not have a description > 160 char" do
		FactoryGirl.build(:pickup, description: "Hello. This is a description with many many many many many many many characters. It should not be apssing the validation--it should be less than a tweet, of which this message is far longer.  Yada Dada Dum di Diddely Poop.  Squatface in a partridge tree.").should_not be_valid
	end

	it "should have an interpretable field of pickup time data..."

	it "should have a type to mark if its farmer's market?"


#parents and children
	it "should return the farm" do
		FactoryGirl.build(:pickup).farm.should_not be_nil
	end

 	it "should return a place" do
  		FactoryGirl.build(:pickup).place.should_not be_nil
  	end

  	it "should yield interval pickups" do
		 a = FactoryGirl.build(:pickup)
	    b = a.interval_pickups.build(FactoryGirl.attributes_for(:interval_pickup))
	    a.interval_pickups.length.should eq(1)
  	end

#hooks
	it "should destroy its children before it destroys itself" do
      a = FactoryGirl.create(:pickup)
      product_interval = FactoryGirl.create(:product_interval)
      b = a.interval_pickups.create(FactoryGirl.attributes_for(:interval_pickup, product_interval_id: product_interval.id))
      b.should be_valid
      id = b.id
      a.destroy
      IntervalPickup.where(id: id).should_not exist
  end

#fxn

end
