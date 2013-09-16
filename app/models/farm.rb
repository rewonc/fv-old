class Farm < ActiveRecord::Base
	has_many :pickups
	has_many :places, through: :pickups

	def new_pickup
		Pickup.new(farm_id: self.id)
	end

end
