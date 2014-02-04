require 'spec_helper'

describe "juiceboxes/show" do
  before(:each) do
    @juicebox = assign(:juicebox, stub_model(Juicebox))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
