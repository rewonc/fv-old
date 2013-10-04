require 'spec_helper'

describe ProductInterval do
  	it "has a valid factory"
	it "belongs to a product, has a valid price and quantity"
	it "should have price in integer format (cents)"
	it "has a valid start date and an end date"
	it "requires choosing attributes if those are available"
	it "can check how many are left"
	it "can see how many are sold"
	it "can see how many are in cart"
	it "cannot be deleted unless all pickups are done as well"
end
