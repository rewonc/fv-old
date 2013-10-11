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

 it "can return the product information it refers to, pickup, and product interval" do
    product = FactoryGirl.create(:product)
    pickup = FactoryGirl.create(:pickup)
    product_interval = FactoryGirl.create(:product_interval, :product_id => product.id)
    interval_pickup = FactoryGirl.create(:interval_pickup, product_interval_id: product_interval.id, pickup_id: pickup.id)
    line_item = FactoryGirl.build(:line_item, interval_pickup_id: interval_pickup.id)
    line_item.should be_valid
    line_item.product.id.should eq(product.id)
    line_item.pickup.id.should eq(pickup.id)
    line_item.product_interval.id.should eq(product_interval.id)
 end


#hooks, fxn

  it "should validate quantity is within range of parent pi" do
      product_interval = FactoryGirl.create(:product_interval, quantity: 20)
      pickup = FactoryGirl.create(:pickup)
      interval_pickup = FactoryGirl.create(:interval_pickup, product_interval_id: product_interval.id, pickup_id: pickup.id)
      #order 1
      cart1 = FactoryGirl.create(:cart)
      saved = interval_pickup.line_items.create(FactoryGirl.attributes_for(:line_item, quantity: 10, cart_id: cart1.id))
      #order 2
      cart2 = FactoryGirl.create(:cart)
      line_item1 = interval_pickup.line_items.build(FactoryGirl.attributes_for(:line_item, quantity: 2, cart_id: cart2.id))
      line_item2 = interval_pickup.line_items.build(FactoryGirl.attributes_for(:line_item, quantity: 15, cart_id: cart2.id))
         
      line_item1.should be_valid
      line_item2.should be_valid
      cart1.finalize.charge_card
      line_item1.should be_valid
      line_item2.should_not be_valid
      line_item2.save.should be_false
  end

  it "must validate whether now is within the time of its parent pi" do
      future_product_interval = FactoryGirl.create(:product_interval, time_start: (Time.now + 5.days).to_datetime, time_end: (Time.now + 35.days).to_datetime)
      current_product_interval = FactoryGirl.create(:product_interval, time_start: (Time.now - 5.days).to_datetime, time_end: (Time.now + 25.days).to_datetime)
      past_product_interval = FactoryGirl.create(:product_interval, time_start: (Time.now - 35.days).to_datetime, time_end: (Time.now + 2.days).to_datetime)
      past_product_interval.time_end = (Time.now - 5.days).to_datetime
      past_product_interval.save
      
      pickup = FactoryGirl.create(:pickup)
      future_interval_pickup = FactoryGirl.create(:interval_pickup, product_interval_id: future_product_interval.id, pickup_id: pickup.id)
      current_interval_pickup = FactoryGirl.create(:interval_pickup, product_interval_id: current_product_interval.id, pickup_id: pickup.id)
      past_interval_pickup = FactoryGirl.create(:interval_pickup, product_interval_id: past_product_interval.id, pickup_id: pickup.id)
      cart = FactoryGirl.create(:cart)
      line_item1 = FactoryGirl.build(:line_item, interval_pickup_id: future_interval_pickup.id)
      line_item2 = FactoryGirl.build(:line_item, interval_pickup_id: current_interval_pickup.id)
      line_item3 = FactoryGirl.build(:line_item, interval_pickup_id: past_interval_pickup.id)
      line_item1.should_not be_valid
      line_item2.should be_valid
      line_item3.should_not be_valid
  end

  it "can see if the desired qty is still available upon simultaneous checkout" do
      product_interval = FactoryGirl.create(:product_interval, quantity: 15)
      pickup = FactoryGirl.create(:pickup)
      interval_pickup = FactoryGirl.create(:interval_pickup, product_interval_id: product_interval.id, pickup_id: pickup.id)
      interval_pickup.should be_valid
      #order 1
      cart1 = FactoryGirl.create(:cart)
      line_item1 = interval_pickup.line_items.create(FactoryGirl.attributes_for(:line_item, quantity: 10, cart_id: cart1.id))
      #order 2
      cart2 = FactoryGirl.create(:cart)
      line_item2 = interval_pickup.line_items.build(FactoryGirl.attributes_for(:line_item, quantity: 10, cart_id: cart2.id))
      
      line_item2.should be_valid
      cart1.finalize
      line_item2.should_not be_valid
  end 

  it "should be able to check that if it is active or purchased or not" do
      cart = FactoryGirl.create(:cart)
      i = 0
      5.times do
        a = FactoryGirl.create(:interval_pickup)
        FactoryGirl.create(:line_item, cart_id: cart.id, interval_pickup_id: a.id)
      end

      cart.line_items.each do |li|
        li.purchased?.should be_false
        li.activated?.should be_false
      end

      cart.finalize

      cart.line_items.each do |li|
        li.purchased?.should be_false
        li.activated?.should be_true
      end

      cart.charge_card

      cart.line_items.each do |li|
        li.purchased?.should be_true
        li.activated?.should be_false
      end
  end

end
