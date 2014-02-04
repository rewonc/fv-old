require 'spec_helper'

describe "juiceboxes/index" do
  before(:each) do
    assign(:juiceboxes, [
      stub_model(Juicebox),
      stub_model(Juicebox)
    ])
  end

  it "renders a list of juiceboxes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
