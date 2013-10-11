require 'spec_helper'

describe IntervalPickup do
#validations
	it "has a valid factory" do
	  	FactoryGirl.build(:interval_pickup).should be_valid
	end

	it "should have data present" do
		FactoryGirl.build(:interval_pickup, product_interval_id: nil).should_not be_valid
		FactoryGirl.build(:interval_pickup, pickup_id: nil).should_not be_valid
		FactoryGirl.build(:interval_pickup, processing_time: nil).should_not be_valid
		FactoryGirl.build(:interval_pickup, charge: nil).should_not be_valid
	end

	it "should have integer hours from 0 to 120" do
		FactoryGirl.build(:interval_pickup, processing_time: 50.5).should_not be_valid
		FactoryGirl.build(:interval_pickup, processing_time: -1).should_not be_valid
		FactoryGirl.build(:interval_pickup, processing_time: 50).should be_valid
	end

	it "should have integer charge from 0 to 10000" do
		FactoryGirl.build(:interval_pickup, processing_time: 50.5).should_not be_valid
		FactoryGirl.build(:interval_pickup, processing_time: 50).should be_valid
	end


#parents and children
	it "should have a product interval" do
		FactoryGirl.build(:interval_pickup).product_interval.should_not be_nil
	end
	it "should have a pickup" do
		FactoryGirl.build(:interval_pickup).pickup.should_not be_nil
	end
	it "should have valid line items" do
		a = FactoryGirl.build(:interval_pickup)
	    b = a.line_items.build(FactoryGirl.attributes_for(:line_item))
	    a.line_items.length.should eq(1)
	end

#hooks
	it "should destroy its children before it destroys itself" do
      a = FactoryGirl.create(:interval_pickup)
      cart = FactoryGirl.create(:cart)
      b = a.line_items.create(FactoryGirl.attributes_for(:line_item, cart_id: cart.id))
      b.should be_valid
      id = b.id
      a.destroy
      LineItem.where(id: id).should_not exist
  end

end
