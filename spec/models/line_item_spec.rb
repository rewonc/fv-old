require 'spec_helper'

describe LineItem do
  it "should default to 1" do
  	a = FactoryGirl.build(:line_item)
  	expect(a.quantity).to eq(1)
  end

  it "should not be created without reference to cart and product" do
  	FactoryGirl.build(:line_item, cart_id: nil).should_not be_valid
  	FactoryGirl.build(:line_item, product_id: nil).should_not be_valid
  end

end
