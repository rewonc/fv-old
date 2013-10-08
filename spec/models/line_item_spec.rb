require 'spec_helper'

describe LineItem do
 
#validations
  it "has a valid factory" do
    a = FactoryGirl.create(:product_interval)
    b = FactoryGirl.create(:interval_pickup, product_interval_id: a.id)
    FactoryGirl.build(:line_item, interval_pickup_id: b.id).should be_valid
  end
  
  it "should have valid data" do
     FactoryGirl.build(:line_item, interval_pickup_id: nil).should_not be_valid
     FactoryGirl.build(:line_item, cart_id: nil).should_not be_valid
     FactoryGirl.build(:line_item, quantity: nil).should_not be_valid
     FactoryGirl.build(:line_item, quantity: 'xuz').should_not be_valid
     FactoryGirl.build(:line_item, quantity: 1.5).should_not be_valid
  end

#parents and cihldren
  it "should reference its interval pickup and cart" do
  	FactoryGirl.build(:line_item).interval_pickup.should_not be_nil
  	FactoryGirl.build(:line_item).cart.should_not be_nil
  end


#hooks 

  it "should check the quantity fits before creation" do
      product_interval = FactoryGirl.create(:product_interval, quantity: 20)
      pickup = FactoryGirl.create(:pickup)
      interval_pickup = FactoryGirl.create(:interval_pickup, product_interval_id: product_interval.id, pickup_id: pickup.id)
      interval_pickup.should be_valid
      cart = FactoryGirl.create(:cart)
      saved = interval_pickup.line_items.create(FactoryGirl.attributes_for(:line_item, quantity: 10, cart_id: cart.id))
      saved.save.should be_true
      line_item = interval_pickup.line_items.build(FactoryGirl.attributes_for(:line_item, quantity: 15, cart_id: cart.id))
      line_item.should be_valid
      line_item.save.should be_false
  end

  it "should check the time is valid before creation"

#fxn
  it "can check if the date is still valid"
  it "can see if the desired qty is still available"
  it "can return the product information it refers to, as well as pickup"


end
