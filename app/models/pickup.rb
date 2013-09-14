class Pickup < ActiveRecord::Base
	belongs_to :farm
	belongs_to :place
end
