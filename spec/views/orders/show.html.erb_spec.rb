require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :name => "Name",
      :size => "Size",
      :price => "Price",
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Size/)
    rendered.should match(/Price/)
    rendered.should match(/Frequency/)
    rendered.should match(/Plan/)
    rendered.should match(/Price/)
    rendered.should match(/Promocode/)
    rendered.should match(/Firstname/)
    rendered.should match(/Lastname/)
    rendered.should match(/Address/)
    rendered.should match(/Apt/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zip/)
    rendered.should match(/Stripetoken/)
    rendered.should match(/1/)
  end
end
