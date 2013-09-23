require 'faker'

FactoryGirl.define do
	factory :cart do

	end

	factory :farm do |f|
		f.title {Faker::Company.name}
		f.description {Faker::Company.catch_phrase}
		f.address {Faker::Address.street_address}
		f.state {Faker::Address.state}
		f.zip {Faker::Address.zip}
	end

	factory :line_item do
		product
		cart
	end

	factory :product do |f|
		f.title {Faker::Commerce.product_name}
		f.description {Faker::Commerce.color}
		f.price {10+rand(99)/1.00}
		f.farm
	end

	factory :place do |f|
		f.title {Faker::Address.city}
		f.state {Faker::Address.state}
	end

	factory :pickup do |f|
		f.farm
		f.place
		f.address {Faker::Address.street_address}
		f.zip {Faker::Address.zip}
		
	end



end