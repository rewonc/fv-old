require 'spec_helper'

describe Cart do
  it "has a valid factory" do
  	FactoryGirl.create(:cart).should be_valid
  end

  it "should list the line items inside, and their corresponding pi_pickups and pi and products" do
  	a = FactoryGirl.create(:cart)
  	a.line_items.build(pi_pickups_id: 1)
  	expect(a.line_items.first.pi_pickups_id).to eq(1)
  end

  it "gives the total price for items in the cart" do
  	a = FactoryGirl.create(:cart)
    b = Array.new
    b[0] = FactoryGirl.create(:product, price: 1.00)
    b[1] = FactoryGirl.create(:product, price: 2.00)
    b[2] = FactoryGirl.create(:product, price: 3.00)

    a.line_items.create(product_id: b[0].id, quantity: 1)
    a.line_items.create(product_id: b[1].id, quantity: 2)
    a.line_items.create(product_id: b[2].id, quantity: 3)

    a.total.should eq(1+4+9)
  end

  it "can be set to hold a userid"

  it "can be cleared, before checkout, reached checkout, paid, past, but only one at a time"

  it "can only be cleared and made history, not totally deleted"


end
