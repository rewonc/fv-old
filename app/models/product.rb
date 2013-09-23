class Product < ActiveRecord::Base
  belongs_to :farm
  has_many :line_items
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :farm_id, presence: true
  validates_length_of :description, maximum: 160, message: "Description must be less than 160 characters"
  validates_numericality_of :price, greater_than_or_equal_to: 0.01, less_than: 1000, message: "Price must be greater than 0 and less than 1000"
  validates :price, numericality: true
  
  before_destroy :ensure_not_referenced_by_any_line_item

  private

  	def ensure_not_referenced_by_any_line_item
  		if line_items.empty?
  			return true
  		else
  			errors.add(:base, 'Line Items present')
  			return false
  		end
  	end
end
