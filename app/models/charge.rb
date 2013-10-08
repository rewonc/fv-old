class Charge < ActiveRecord::Base
	validates :cart_id, presence: true
	belongs_to :cart
end
