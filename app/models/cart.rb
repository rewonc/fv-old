class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy
	has_one :charge

	def total
		a = 0
		line_items.each do |li|
			fee = li.interval_pickup.charge
			base = li.quantity * li.interval_pickup.product_interval.base_price
			a = a + fee + base
		end
		return a
	end

	def finalize
		##run checks on all the items
		##hold the orders--make it unavailable to anyone else.
		self.update_attribute(:active, true)
		self.update_attribute(:paid, false)
		self.reload
	end

	def unfinalize_stale_cart
		if self.active && ((self.updated_at.to_time) < (Time.now - 60.minutes))
		self.update_attribute(:active, false)
		self.update_attribute(:paid, false)
		self.reload
		end
	end

	def charge_card
		## process payment
		self.update_attribute(:paid, true)
		self.update_attribute(:active, false)
		self.reload
	end

end
