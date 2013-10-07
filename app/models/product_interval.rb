class ProductInterval < ActiveRecord::Base
  belongs_to :product
  has_many :interval_pickups
  has_many :pickups, through: :interval_pickups 
  validates_numericality_of :base_price, greater_than_or_equal_to: 1, less_than: 100000, only_integer: true, message: "Price must at least one cent and less than 1000,00 cents"
  validates_numericality_of :quantity, greater_than_or_equal_to: 1, less_than: 10000, only_integer: true, message: "Quantity must at least one and less than 10000 and an integer"
  serialize :product_tags
  validates :product_id, presence: true
  validates :time_start, presence: true
  validates :time_end, presence: true
end
