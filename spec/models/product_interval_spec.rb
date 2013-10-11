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

	it "validates on create that the end date is greater than start date by at least a day, and that the end date is at least a day in advance" do
    FactoryGirl.build(:product_interval, time_start: (Time.now - 10.days).to_datetime, time_end: (Time.now - 5.days).to_datetime).should_not be_valid
    FactoryGirl.build(:product_interval, time_start: (Time.now - 5.days).to_datetime, time_end: (Time.now + 5.days).to_datetime).should be_valid
    FactoryGirl.build(:product_interval, time_start: (Time.now + 5.days).to_datetime, time_end: (Time.now + 5.days).to_datetime).should_not be_valid
    FactoryGirl.build(:product_interval, time_start: (Time.now - 5.days).to_datetime, time_end: (Time.now).to_datetime).should_not be_valid
    FactoryGirl.build(:product_interval, time_start: (Time.now + 5.days).to_datetime, time_end: (Time.now + 3.days).to_datetime).should_not be_valid
    FactoryGirl.build(:product_interval, time_start: (Time.now + 5.days).to_datetime, time_end: (Time.now + 15.days).to_datetime).should be_valid
    FactoryGirl.build(:product_interval, time_start: (Time.now).to_datetime, time_end: (Time.now + 15.days).to_datetime).should be_valid
  end

  it "the end date can be in the past on update" do
    pi = FactoryGirl.create(:product_interval, time_start: (Time.now - 10.days).to_datetime, time_end: (Time.now + 15.days).to_datetime)
    pi.time_end = (Time.now - 5.days).to_datetime
    pi.save.should be_true
    pi.reload
    pi.time_end.to_time.should be < Time.now
  end

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
     cart = FactoryGirl.create(:cart)
     c = FactoryGirl.create(:line_item, interval_pickup_id: b.id, quantity: 6, cart_id: cart.id)
     b.should be_valid
     c.should be_valid
     cart.finalize
     a.quantity_finalized.should eq(6)
     a.quantity_purchased.should eq(0)
     a.quantity_left.should eq(14)
     cart.charge_card
     a.reload
     a.quantity_finalized.should eq(0)
     a.quantity_purchased.should eq(6)
     a.quantity_left.should eq(14)
  end

	it "can see how many have been purchased" do
     a = FactoryGirl.create(:product_interval, quantity: 20)
     b = FactoryGirl.create(:interval_pickup, product_interval_id: a.id)
     i = 1
     carts = Array.new

     3.times do
      carts[i] = FactoryGirl.create(:cart)
      FactoryGirl.create(:line_item, interval_pickup_id: b.id, quantity: i, cart_id: carts[i].id)
      i = i+1
     end
     carts[2].finalize.charge_card
     carts[3].finalize.charge_card
     carts[1].finalize
     a.quantity_finalized.should eq(1)
     a.quantity_purchased.should eq(5)
  end

  it "can unfinalize line items in a cart that have been finalized for at least 1 hr without checkout" do
      product_interval = FactoryGirl.create(:product_interval, quantity: 20)
      pickup = FactoryGirl.create(:pickup)
      interval_pickup = FactoryGirl.create(:interval_pickup, product_interval_id: product_interval.id, pickup_id: pickup.id)
      i = 0
      carts = Array.new
      5.times do
        carts[i] = FactoryGirl.create(:cart)
        FactoryGirl.create(:line_item, cart_id: carts[i].id, interval_pickup_id: interval_pickup.id, quantity: 1)
          i = i+1
      end


      i = 22
      carts.each do |c|
         c.finalize.update_attribute(:updated_at, (Time.now - i.minutes).to_datetime)
         c.reload
        i = i + 22
      end

      product_interval.quantity_left.should eq(15)
      product_interval.refresh_line_items
      product_interval.quantity_left.should eq(18)
  end

end
