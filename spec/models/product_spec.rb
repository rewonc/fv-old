require 'spec_helper'

describe Product do

  #validations
  it "has a valid factory" do
  	FactoryGirl.create(:product).should be_valid
  end

  it "is invalid without required fields present" do 
  	FactoryGirl.build(:product, title: nil).should_not be_valid
  	FactoryGirl.build(:product, description: nil).should_not be_valid
  	FactoryGirl.build(:product, farm_id: nil).should_not be_valid
  end

  it "is invalid with a description of more than 160 characters" do
  	FactoryGirl.build(:product, description: "Hello. This is a description with many many many many many many many characters. It should not be apssing the validation--it should be less than a tweet, of which this message is far longer.  Yada Dada Dum di Diddely Poop.  Squatface in a partridge tree.").should_not be_valid
  end

  #parents and children
  it "should belong to a farm" do
    FactoryGirl.build(:product).farm.should_not be_nil
  end

  it "should be linked w/ product intervals" do
    a = FactoryGirl.build(:product)
    b = a.product_intervals.build(FactoryGirl.attributes_for(:product_interval))
    a.product_intervals.length.should eq(1)
  end

  #hooks

   it "should destroy its children before it destroys itself" do
      a = FactoryGirl.create(:product)
      b = a.product_intervals.create(FactoryGirl.attributes_for(:product_interval))
      b.should be_valid
      id = b.id
      a.destroy
      ProductInterval.where(id: id).should_not exist
  end
  
  #other fxn

  it "should list the pickups it is available at" do
    product = FactoryGirl.create(:product)
    pickup = FactoryGirl.create(:pickup)
    2.times do
      product.product_intervals.create!(FactoryGirl.attributes_for(:product_interval)).interval_pickups.create(FactoryGirl.attributes_for(:interval_pickup, pickup_id: pickup.id))
    end
    product.pickups.should exist
    product.pickups.length.should eq(2)
  end

  it "should be linked with possible attributes"

end
