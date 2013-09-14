class Place < ActiveRecord::Base
	has_many :pickups
	has_many :farms, through: :pickups
end
