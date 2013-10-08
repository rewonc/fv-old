class IntervalPickup < ActiveRecord::Base
  belongs_to :product_interval
  belongs_to :pickup
  has_many :line_items, dependent: :destroy

  validates :product_interval_id, presence: true
  validates :pickup_id, presence: true
  validates :processing_time, presence: true
  validates :charge, presence: true
  validates_numericality_of :processing_time, only_integer: true, greater_than_or_equal_to: 0, less_than: 120
  validates_numericality_of :charge, only_integer: true, greater_than_or_equal_to: 0, less_than: 10000
  

end
