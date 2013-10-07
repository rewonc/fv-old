class Pickup < ActiveRecord::Base
	belongs_to :farm
	belongs_to :place
	has_many :interval_pickups
	has_many :product_intervals, through: :interval_pickups
	serialize :period
	validates :farm_id, presence: true
	validates :place_id, presence: true
	validates :address, presence: true
	validates :zip, presence: true
	validates :period, presence: true
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates_length_of :description, maximum: 160
	validates_format_of :zip, :with => /\A\d{5}-\d{4}|\A\d{5}\z/, :message => "should be in the form 12345 or 12345-1234"

end
