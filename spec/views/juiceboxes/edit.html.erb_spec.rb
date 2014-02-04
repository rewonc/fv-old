require 'spec_helper'

describe "juiceboxes/edit" do
  before(:each) do
    @juicebox = assign(:juicebox, stub_model(Juicebox))
  end

  it "renders the edit juicebox form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", juicebox_path(@juicebox), "post" do
    end
  end
end
