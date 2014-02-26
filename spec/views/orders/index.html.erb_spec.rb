require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :name => "Name",
        :size => "Size",
        :frequency => "Frequency",
        :plan => "Plan",
        :price => "Price",
        :promocode => "Promocode",
        :firstname => "Firstname",
        :lastname => "Lastname",
        :address => "Address",
        :apt => "Apt",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :stripetoken => "Stripetoken",
        :user_id => 1
      ),
      stub_model(Order,
        :name => "Name",
        :size => "Size",
        :frequency => "Frequency",
        :plan => "Plan",
        :price => "Price",
        :promocode => "Promocode",
        :firstname => "Firstname",
        :lastname => "Lastname",
        :address => "Address",
        :apt => "Apt",
        :city => "City",
        :state => "State",
        :zip => "Zip",
        :stripetoken => "Stripetoken",
        :user_id => 1
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Size".to_s, :count => 2
    assert_select "tr>td", :text => "Frequency".to_s, :count => 2
    assert_select "tr>td", :text => "Plan".to_s, :count => 2
    assert_select "tr>td", :text => "Price".to_s, :count => 2
    assert_select "tr>td", :text => "Promocode".to_s, :count => 2
    assert_select "tr>td", :text => "Firstname".to_s, :count => 2
    assert_select "tr>td", :text => "Lastname".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Apt".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip".to_s, :count => 2
    assert_select "tr>td", :text => "Stripetoken".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
