require 'spec_helper'

describe IntervalPickup do
it "has a valid factory" do
  	FactoryGirl.create(:interval_pickup).should be_valid
end

	it "should have valid data"
	it "should be backtraceable to a product interval, product, price, and pickup"
	it "should have a processing time"
	it "should have an extra fee field, several"
	it "should be able to guess the processing time from other stuff at that location"
	it "should be able to guess the charge from other stuff at that location"
	it "is not deletable until all line items are deleted"
end
