class Farm < ActiveRecord::Base
	has_many :pickups
	has_many :products
	has_many :places, through: :pickups

	def new_pickup
		Pickup.new(farm_id: self.id)
	end

	def new_product
		Product.new(farm_id: self.id)
	end

end
