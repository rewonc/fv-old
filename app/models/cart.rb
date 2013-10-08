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

end
