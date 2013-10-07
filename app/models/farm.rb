class Farm < ActiveRecord::Base
	has_many :pickups, dependent: :destroy
	has_many :products, dependent: :destroy
	has_many :places, through: :pickups
	belongs_to :farmer

	has_attached_file :logo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('missing.png')

	validates :title, presence: true, uniqueness: true
	validates :address, presence: true
	validates :state, presence: true
	validates :farmer_id, presence: true
	validates :zip, presence: true
	validates_format_of :zip, :with => /\A\d{5}-\d{4}|\A\d{5}\z/, :message => "should be in the form 12345 or 12345-1234"
	validates :description, presence: true
	validates_length_of :description, maximum: 160

end
