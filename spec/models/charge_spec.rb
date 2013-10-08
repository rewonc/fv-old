require 'spec_helper'

describe Charge do
#validations
 it "should have a valid factory" do
      FactoryGirl.build(:charge).should be_valid
 end

 it "needs a valid cart id" do
  	FactoryGirl.build(:charge, cart_id: nil).should_not be_valid
  end

  #parent
  it "should reference a cart" do
  	FactoryGirl.build(:charge).cart.should_not be_nil
  end

#hooks	
  it "it is linked to a current, validated cart before it is created"

end
