require 'spec_helper'

describe Farmer do

	#validations
  it "should validate firstname, lastname, and age" do
  	FactoryGirl.build(:farmer, first_name: nil).should_not be_valid
  	FactoryGirl.build(:farmer, last_name: nil).should_not be_valid
  	FactoryGirl.build(:farmer, age: nil).should_not be_valid
  	FactoryGirl.build(:farmer, age: "string").should_not be_valid
  	FactoryGirl.build(:farmer, age: 0).should_not be_valid
  	FactoryGirl.build(:farmer, age: 25).should be_valid
  end

  #hooks
  it "should destroy its children before it destroys itself" do
      a = FactoryGirl.create(:farmer)
      b = a.create_farm(FactoryGirl.attributes_for(:farm))
      b.should be_valid
      farm_id = b.id
      a.destroy
      Farm.where(id: farm_id).should_not exist
  end

  #fxn

end
