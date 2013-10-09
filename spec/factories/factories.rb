require 'faker'

FactoryGirl.define do

	factory :place do |f|
		f.title {Faker::Address.city}
		f.state {Faker::Address.state}
	end

  	factory :farmer do
  		first_name {Faker::Name.first_name}
  		last_name {Faker::Name.first_name}
  		age {[*15,80].sample}
  		email {Faker::Internet.email}
  		password 'password7'
  		password_confirmation 'password7'
  	end
	
	factory :farm do |f|
		f.title {Faker::Company.name}
		f.description {Faker::Company.catch_phrase}
		f.address {Faker::Address.street_address}
		f.state {Faker::Address.state}
		f.zip {Faker::Address.zip}
		f.farmer
		##add in picture link here
	end

	factory :product do |f|
		f.title {Faker::Commerce.product_name}
		f.description {Faker::Commerce.color}
		f.farm
		##add in picture link here
	end

  	factory :product_interval do
	    product
	    quantity {[*5,200].sample}
	    base_price {[*400,66000].sample}
	    time_start "2013-10-20 12:05:59"
	    time_end "2013-10-28 12:05:59"
	    product_tags {{color: "red", size: "large"}}
  	end

  	factory :pickup do |f|
		f.farm
		f.place
		f.description {Faker::Company.name}
		f.address {Faker::Address.street_address}
		f.zip {Faker::Address.zip}
		f.period { [{date: "Some date",time: "some time"}, {date: "date2", time: "time2"}]  }
		f.latitude {Faker::Address.latitude}
		f.longitude {Faker::Address.longitude}
	end

	factory :interval_pickup do
	    product_interval 
	    pickup 
	    processing_time {rand(4)*12}   #in hours
	    charge {rand(500)}
	    charge1 nil
	    charge2 nil
	  end


	factory :line_item do
		interval_pickup
		cart
		quantity {[*1,3].sample}
	end

	factory :charge do
		cart
	end

  	factory :product_tag do
	    product 
	    options {["red","blue","green"]}
	    title "color"
	    #not started yet
  	end

  	factory :cart do
  		active false
  		paid false
	end

end