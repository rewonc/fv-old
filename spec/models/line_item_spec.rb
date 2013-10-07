require 'spec_helper'

describe LineItem do
  it "has a valid factory" do
    FactoryGirl.create(:line_item).should be_valid
  end


  it "should not be created without reference to cart and interval pickup" do
  	FactoryGirl.build(:line_item, cart_id: nil).should_not be_valid
  	FactoryGirl.build(:line_item, interval_pickup_id: nil).should_not be_valid
  end

  it "can return the products it refers to and also where they belong"

  it "can check if the date is valid"
  it "can see if the desired qty is still available"

  it "checks qty and etc before creating"


end
