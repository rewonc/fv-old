class IntervalPickup < ActiveRecord::Base
  belongs_to :product_interval
  belongs_to :pickup
end
