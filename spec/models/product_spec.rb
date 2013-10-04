require 'spec_helper'

describe Product do
  it "has a valid factory" do
  	FactoryGirl.create(:product).should be_valid
  end

  it "is invalid without required fields present" do 
  	FactoryGirl.build(:product, title: nil).should_not be_valid
  	FactoryGirl.build(:product, description: nil).should_not be_valid
  	FactoryGirl.build(:product, price: nil).should_not be_valid
  	FactoryGirl.build(:product, farm_id: nil).should_not be_valid
  end

  it "is invalid with a description of more than 160 characters" do
  	FactoryGirl.build(:product, description: "Hello. This is a description with many many many many many many many characters. It should not be apssing the validation--it should be less than a tweet, of which this message is far longer.  Yada Dada Dum di Diddely Poop.  Squatface in a partridge tree.").should_not be_valid
  end

  it "is invalid when prices aren't a number" do
  	FactoryGirl.build(:product, price: "abc").should_not be_valid
  	FactoryGirl.build(:product, price: "^&0A").should_not be_valid

  end

  it "is invalid for prices above 999.99 or below .01" do
	FactoryGirl.build(:product, price: 1000.12).should_not be_valid
	FactoryGirl.build(:product, price: -23.12).should_not be_valid
	FactoryGirl.build(:product, price: 0.000001).should_not be_valid
  end

  it "is not destroyable when p intervals are present" do
  	a = FactoryGirl.create(:product)
  	b = a.id
  	2.times do
  		a.p_intervals.build()
  	end
  	a.destroy
  	Product.find(b).should be_valid
  end

  it "should not have a price"
  it "should list the p intervals and pickups it is available at"
  it "should be linked with possible attributes"

end
