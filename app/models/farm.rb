class Farm < ActiveRecord::Base
	has_many :pickups
	has_many :products
	has_many :places, through: :pickups

	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('missing.png')

	def new_pickup
		Pickup.new(farm_id: self.id)
	end

	def new_product
		Product.new(farm_id: self.id)
	end

end
