class LineItem < ActiveRecord::Base
	belongs_to :interval_pickup
	belongs_to :cart
	validates :cart_id, presence: true
	validates :interval_pickup_id, presence: true
end
