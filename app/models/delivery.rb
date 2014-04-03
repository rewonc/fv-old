class Delivery < ActiveRecord::Base
  belongs_to :order
end
