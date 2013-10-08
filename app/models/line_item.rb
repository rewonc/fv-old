class LineItem < ActiveRecord::Base
	belongs_to :interval_pickup
	belongs_to :cart
	validates :cart_id, presence: true
	validates :interval_pickup_id, presence: true
	validates :quantity, presence: true
    validates_numericality_of :quantity, only_integer: true, greater_than: 0, less_than: 100
    before_create :ensure_quantity

    def ensure_quantity
    	if interval_pickup.product_interval.quantity_left.nil?
			return false
		else 
			if self.quantity > self.interval_pickup.product_interval.quantity_left
					return false
			else 
				return true
			end
		end
	end


end
