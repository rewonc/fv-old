class Product < ActiveRecord::Base
  belongs_to :farm
  has_many :product_intervals, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  validates :farm_id, presence: true
  validates_length_of :description, maximum: 160, message: "Description must be less than 160 characters"
  
end
