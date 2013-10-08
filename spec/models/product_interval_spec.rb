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
  it "should destroy its children before it destroys itself" do
      a = FactoryGirl.create(:product_interval)
      pickup = FactoryGirl.create(:pickup)
      b = a.interval_pickups.create(FactoryGirl.attributes_for(:interval_pickup, pickup_id: pickup.id))
      b.should be_valid
      id = b.id
      a.destroy
      IntervalPickup.where(id: id).should_not exist
  end

  ##extra fxn

	it "requires choosing attributes if those are available"

	it "can check how many are left" do
     a = FactoryGirl.create(:product_interval, quantity: 20)
     b = FactoryGirl.create(:interval_pickup, product_interval_id: a.id)
     c = FactoryGirl.create(:line_item, interval_pickup_id: b.id, quantity: 6)
     b.should be_valid
     c.should be_valid
     a.quantity_carted.should eq(6)
     a.quantity_left.should eq(14)
  end

	it "can see how many are sold--adjust quantity_left"

end
