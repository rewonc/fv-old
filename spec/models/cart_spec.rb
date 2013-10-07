require 'spec_helper'

describe Cart do
  it "has a valid factory" do
  	FactoryGirl.create(:cart).should be_valid
  end

  it "should list the line items inside, and their corresponding interval pickups and intevals and products" do
  	a = FactoryGirl.create(:cart)
  	a.line_items.build(interval_pickup_id: 1)
  	expect(a.line_items.first.interval_pickup_id).to eq(1)
  end

  it "gives the total price for items in the cart" do
  	a = FactoryGirl.create(:cart)
    first = FactoryGirl.create(:product_interval, base_price: 500)
    second = FactoryGirl.create(:product_interval, base_price: 600)
    first_deriv = first.interval_pickups.create(FactoryGirl.attributes_for(:interval_pickup, charge: 100))
    second_deriv = second.interval_pickups.create(FactoryGirl.attributes_for(:interval_pickup, charge: 100))

    a.line_items.create(interval_pickup_id: first_deriv.id, quantity: 1)
    a.line_items.create(interval_pickup_id: second_deriv.id, quantity: 2)
   

    a.total.should eq((5+6*2+1+1)*100)
  end

  it "can be set to hold a userid"

  it "can be cleared, before checkout, reached checkout, paid, past, but only one at a time"

  it "can only be cleared and made history, not totally deleted"

  it "should calculate if two items from the same location have the same processing cost"

  it "should calculate in all integers"


end
