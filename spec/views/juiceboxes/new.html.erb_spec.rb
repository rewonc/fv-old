require 'spec_helper'

describe "juiceboxes/new" do
  before(:each) do
    assign(:juicebox, stub_model(Juicebox).as_new_record)
  end

  it "renders new juicebox form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", juiceboxes_path, "post" do
    end
  end
end
