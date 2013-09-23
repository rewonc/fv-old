class Place < ActiveRecord::Base
	has_many :pickups
	has_many :farms, through: :pickups
	has_many :products, through: :farms

	validates :title, presence: true
	validates :state, presence: true
end
