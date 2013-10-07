class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def total
		a = 0
		line_items.each do |item|
			fee = item.interval_pickup.charge  #account for if there's another thing
			base = item.quantity * item.interval_pickup.product_interval.base_price
			a = a + fee + base
		end
		return a

	end

end
