class Farm < ActiveRecord::Base
	has_many :pickups
	has_many :places, through: :pickups
end
