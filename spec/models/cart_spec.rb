require 'spec_helper'

describe Cart do

  #validations
  it "has a valid factory" do
  	FactoryGirl.build(:cart).should be_valid
  end

  #parents and children
it "lists its line items" do
    a = FactoryGirl.create(:cart)
    b = a.line_items.build(FactoryGirl.attributes_for(:line_item))
    a.line_items.length.should eq(1)
end

it "lists its charge" do
    a = FactoryGirl.create(:cart)
    b = a.build_charge()
    a.charge.should be_valid
end

it "should optionally belong to a user"

  #hooks

  #fxn
  

  it "gives the total price for items in the cart" do
    	a = FactoryGirl.create(:cart)
      b = Array.new
      c = Array.new
      i = 0
      2.times do
        c[i] = FactoryGirl.create(:product_interval, base_price: 5500)
        b[i] = FactoryGirl.create(:interval_pickup, charge: 400, product_interval_id: c[i].id)
        a.line_items.create(FactoryGirl.attributes_for(:line_item, interval_pickup_id: b[i].id, quantity: 1))
        i = i + 1
      end

      a.total.should eq(2*5900)
  end

  it "can be finalized" do
    cart = FactoryGirl.create(:cart)
    cart.active.should be_false
    cart.finalize
    cart.active.should be_true
  end

  it "can be charged"

  it "can be finished"

  it "should check that finalization is valid--all items are active--before checkout"
  
  it "can designate that the order is past -- i.e. delivered and paid out to farmer"

  it "should calculate if two items from the same location have a lowered processing cost"

end
