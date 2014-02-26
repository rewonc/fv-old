require 'spec_helper'

describe "orders/edit" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :name => "MyString",
      :size => "MyString",
      :price => "MyString",
      :frequency => "MyString",
      :plan => "MyString",
      :price => "MyString",
      :promocode => "MyString",
      :firstname => "MyString",
      :lastname => "MyString",
      :address => "MyString",
      :apt => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip => "MyString",
      :stripetoken => "MyString",
      :user_id => 1
    ))
  end

  it "renders the edit order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", order_path(@order), "post" do
      assert_select "input#order_name[name=?]", "order[name]"
      assert_select "input#order_size[name=?]", "order[size]"
      assert_select "input#order_price[name=?]", "order[price]"
      assert_select "input#order_frequency[name=?]", "order[frequency]"
      assert_select "input#order_plan[name=?]", "order[plan]"
      assert_select "input#order_price[name=?]", "order[price]"
      assert_select "input#order_promocode[name=?]", "order[promocode]"
      assert_select "input#order_firstname[name=?]", "order[firstname]"
      assert_select "input#order_lastname[name=?]", "order[lastname]"
      assert_select "input#order_address[name=?]", "order[address]"
      assert_select "input#order_apt[name=?]", "order[apt]"
      assert_select "input#order_city[name=?]", "order[city]"
      assert_select "input#order_state[name=?]", "order[state]"
      assert_select "input#order_zip[name=?]", "order[zip]"
      assert_select "input#order_stripetoken[name=?]", "order[stripetoken]"
      assert_select "input#order_user_id[name=?]", "order[user_id]"
    end
  end
end
