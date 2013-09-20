class Cart < ActiveRecord::Base
	has_many :line_items, dependent: :destroy

	def total
		a = 0
		line_items.each do |item|
			a = a + item.quantity * item.product.price
		end
		return a
	end

end
