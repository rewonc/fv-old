class LineItem < ActiveRecord::Base
	belongs_to :interval_pickup
	belongs_to :cart
	validates :cart_id, presence: true
	validates :interval_pickup_id, presence: true
	validates :quantity, presence: true
    validates_numericality_of :quantity, only_integer: true, greater_than: 0, less_than: 100
    validate :ensure_quantity
    validate :ensure_date

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
    	if interval_pickup.nil? || (self.quantity == nil)
		  errors.add(:base, 'No interval pickup associated w this item')

		else 
			if self.quantity > self.interval_pickup.product_interval.reload.quantity_left
				errors.add(:quantity, 'Quantity for this cart item exceeds the quantity available')
			else 
				return true
			end
		end
	end

    def ensure_date
        if interval_pickup.nil?
            errors.add(:base, 'No interval pickup associated with this object')
        else 
            if (Time.now > interval_pickup.product_interval.time_end) || (Time.now < interval_pickup.product_interval.time_start)
                errors.add(:base, 'Now is outside of the range of valid times for this item')
            else 
                return true
            end
        end
    end


end
