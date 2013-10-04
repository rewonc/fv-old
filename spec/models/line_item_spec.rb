require 'spec_helper'

describe LineItem do
  it "has a valid factory"

  it "quantity should default to 1" do
  	a = FactoryGirl.build(:line_item)
  	expect(a.quantity).to eq(1)
  end

  it "should not be created without reference to cart and pi_pickup" do
  	FactoryGirl.build(:line_item, cart_id: nil).should_not be_valid
  	FactoryGirl.build(:line_item, pi_pickup_id: nil).should_not be_valid
  end

  it "can return the products it refers to and also where they belong"

  it "can check if the date is valid"
  it "can see if the desired qty is still available"




end
