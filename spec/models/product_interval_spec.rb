require 'spec_helper'

describe ProductInterval do

	##validations
  	it "has a valid factory" do
  		FactoryGirl.create(:product_interval).should be_valid
  	end

  	it "has valid fields" do
  		FactoryGirl.build(:product_interval, product_id: nil).should_not be_valid
  		FactoryGirl.build(:product_interval, time_start: nil).should_not be_valid
  	  	FactoryGirl.build(:product_interval, time_end: nil).should_not be_valid
  	end

  it "Prices must be between $0.01 and $999.99" do
  	FactoryGirl.build(:product_interval, base_price: nil).should_not be_valid
	FactoryGirl.build(:product_interval, base_price: "abc").should_not be_valid
	FactoryGirl.build(:product_interval, base_price: "^&0A").should_not be_valid
	FactoryGirl.build(:product_interval, base_price: 1000.12).should_not be_valid
	FactoryGirl.build(:product_interval, base_price: -23).should_not be_valid
	FactoryGirl.build(:product_interval, base_price: 0.000001).should_not be_valid
	FactoryGirl.build(:product_interval, base_price: 100000).should_not be_valid
	FactoryGirl.build(:product_interval, base_price: 91820).should be_valid
	FactoryGirl.build(:product_interval, base_price: 5520).should be_valid
  end

  it "is invalid for negative quantities or floats, or above 10k" do
	FactoryGirl.build(:product_interval, quantity: -10).should_not be_valid
	FactoryGirl.build(:product_interval, quantity: 10.5).should_not be_valid
	FactoryGirl.build(:product_interval, quantity: 100).should be_valid
	FactoryGirl.build(:product_interval, quantity: 10001).should_not be_valid
  end

	it "has a valid start date and an end date, in the future"

  ##parents and children
  it "lists its parent product" do
  	FactoryGirl.build(:product_interval).product.should_not be_nil
  end

  it "lists its int pickup" do
  	 a = FactoryGirl.build(:product_interval)
    b = a.interval_pickups.build(FactoryGirl.attributes_for(:interval_pickup))
    a.interval_pickups.length.should eq(1)
  end

  ##hooks
  	it "deletes pickups on destroy"

  ##extra fxn

	it "requires choosing attributes if those are available"
	it "can check how many are left"
	it "can see how many are sold"
	it "can see how many are in cart"
end
