require 'spec_helper'

describe Farm do
  
  ##validations
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
    FactoryGirl.build(:farm, farmer_id: nil).should_not be_valid
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

  ##hooks
  it "should destroy its children before it destroys itself" do
      a = FactoryGirl.create(:farm)
      b = a.products.create(FactoryGirl.attributes_for(:product))
      b.should be_valid
      place = FactoryGirl.create(:place)
      c = a.pickups.create(FactoryGirl.attributes_for(:pickup, place_id: place.id))
      c.should be_valid
      product_id = b.id
      pickup_id = c.id
      a.destroy
      Product.where(id: product_id).should_not exist
      Pickup.where(id: pickup_id).should_not exist
  end

  ##parents and children
  it "should generate a list of its products" do
    a = FactoryGirl.build(:farm)
    b = a.products.build(FactoryGirl.attributes_for(:product))
    a.products.length.should eq(1)
  end

  it "should generate a list of its pickups service areas" do
    a = FactoryGirl.build(:farm)
    b = a.pickups.build(FactoryGirl.attributes_for(:pickup))
    a.pickups.length.should eq(1)
  end

  it "should belong to a farmer" do
    FactoryGirl.build(:farm).farmer.should_not be_nil
  end

end
