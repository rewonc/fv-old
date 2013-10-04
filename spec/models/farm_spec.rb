require 'spec_helper'

describe Farm do
  it "has a valid factory" do
  	FactoryGirl.create(:farm).should be_valid
  end

  it "is invalid without required fields present" do 
  	FactoryGirl.build(:farm, title: nil).should_not be_valid
  	FactoryGirl.build(:farm, address: nil).should_not be_valid
  	FactoryGirl.build(:farm, address: "").should_not be_valid
  	FactoryGirl.build(:farm, state: nil).should_not be_valid
  	FactoryGirl.build(:farm, zip: nil).should_not be_valid
  	FactoryGirl.build(:farm, description: nil).should_not be_valid
  end

   it "is invalid without a unique title" do 
  	FactoryGirl.create(:farm, title: "Funky Farm")
  	FactoryGirl.build(:farm, title: "Funky Farm").should_not be_valid
  end

  it "is invalid without properly formatted zip code" do
  	FactoryGirl.build(:farm, zip: "abc11").should_not be_valid
  	FactoryGirl.build(:farm, zip: "4922").should_not be_valid
  	FactoryGirl.build(:farm, zip: "81912-1120").should be_valid
  	FactoryGirl.build(:farm, zip: "29398").should be_valid
  	FactoryGirl.build(:farm, zip: "492211").should_not be_valid
  end

  it "is invalid with a description of more than 160 characters" do
  	FactoryGirl.build(:farm, description: "Hello. This is a description with many many many many many many many characters. It should not be apssing the validation--it should be less than a tweet, of which this message is far longer.  Yada Dada Dum di Diddely Poop.  Squatface in a partridge tree.").should_not be_valid
  end

  it "should not be deleted while it still has offspring products" 

  it "should generate a list of its products"

  it "should generate a list of its pickups service areas"

  it "should belong to a farmer"

end
