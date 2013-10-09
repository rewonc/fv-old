class LineItem < ActiveRecord::Base
	belongs_to :interval_pickup
	belongs_to :cart
	validates :cart_id, presence: true
	validates :interval_pickup_id, presence: true
	validates :quantity, presence: true
    validates_numericality_of :quantity, only_integer: true, greater_than: 0, less_than: 100
    before_create :ensure_quantity

    def purchased?
    	if cart.paid
    		return true
    	else
    		return false
    	end
    end

    def activated?
    	if cart.active
    		return true
    	else
    		return false
    	end
    end

    def product
    	interval_pickup.product_interval.product
    end
    def pickup
    	interval_pickup.pickup
    end
    def product_interval
    	interval_pickup.product_interval
    end

    def ensure_quantity
    	if interval_pickup.product_interval.quantity_left.nil?
			return false
		else 
			if self.quantity > self.interval_pickup.product_interval.reload.quantity_left
					return false
			else 
				return true
			end
		end
	end


end
