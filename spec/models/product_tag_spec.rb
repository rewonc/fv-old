require 'spec_helper'

describe ProductTag do

it "has a valid factory" do
  	FactoryGirl.create(:product_tag).should be_valid
end

	it "should generate which product it applies to"
	it "should have valid data entries upon creation"
	it "should generate which p_intervals it applies to"
	it "should check that all products referencing it are gone before deleting itself"
end
