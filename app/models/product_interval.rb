class ProductInterval < ActiveRecord::Base
  belongs_to :product
  has_many :interval_pickups, dependent: :destroy
  has_many :pickups, through: :interval_pickups 
  validates_numericality_of :base_price, greater_than_or_equal_to: 1, less_than: 100000, only_integer: true, message: "Price must at least one cent and less than 1000,00 cents"
  validates_numericality_of :quantity, greater_than_or_equal_to: 1, less_than: 10000, only_integer: true, message: "Quantity must at least one and less than 10000 and an integer"
  serialize :product_tags
  validates :product_id, presence: true
  validates :time_start, presence: true
  validates :time_end, presence: true
  validate :check_temporality, on: :create


  def check_temporality
    if self.time_end.nil? || self.time_start.nil?
      errors.add(:base, "a time must be present")
    else 
      if self.time_end.to_time < (Time.now + 1.day)
        errors.add(:time_end, "Time end must be in the future")
      end 
      if self.time_end.to_time < (self.time_start.to_time + 1.day)
        errors.add(:time_end, "End time must be at least 1 day after the start time")
      end 
    end
  end

  def refresh_line_items
    interval_pickups.each do |ip|
      ip.line_items.each do |li|
        if li.cart.active 
          li.cart.unfinalize_stale_cart
        end
      end
    end
  end

  def quantity_purchased
    a = 0
    interval_pickups.each do |ip|
      ip.line_items.each do |li|
        if li.cart.paid 
          a = a + li.quantity
        end
      end
    end
    return a
  end
  def quantity_finalized
  	a = 0
  	interval_pickups.each do |ip|
  		ip.line_items.each do |li|
  		  if li.cart.active	
          a = a + li.quantity
  		  end
      end
  	end
  	return a
  end

  def quantity_left
  	return quantity - quantity_finalized - quantity_purchased
  end

end
