class Pickup < ActiveRecord::Base
	belongs_to :farm
	belongs_to :place
	validates :farm_id, presence: true
	validates :place_id, presence: true
	validates :address, presence: true
	validates :zip, presence: true
	validates_format_of :zip, :with => /\A\d{5}-\d{4}|\A\d{5}\z/, :message => "should be in the form 12345 or 12345-1234"
end
