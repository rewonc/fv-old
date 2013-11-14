class Charge < ActiveRecord::Base
	validates :box_id, presence: true
	belongs_to :box
end
