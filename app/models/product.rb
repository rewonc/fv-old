class Product < ActiveRecord::Base
  belongs_to :farm
  has_many :product_intervals
  validates :title, presence: true
  validates :description, presence: true
  validates :farm_id, presence: true
  validates_length_of :description, maximum: 160, message: "Description must be less than 160 characters"
  before_destroy :ensure_not_referenced_by_any_p_int

  private

  	def ensure_not_referenced_by_any_p_int
  		if product_intervals.empty?
  			return true
  		else
  			errors.add(:base, 'product intervals present')
  			return false
  		end
  	end
end
