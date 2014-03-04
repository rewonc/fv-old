class Order < ActiveRecord::Base
  validates :box_count, presence: true
  validates :frequency, presence: true
  validates :fullname, presence: true
  validates :address1, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true
  validates :delivery_window, presence: true
  validates :first_delivery, presence: true
  belongs_to :user
  belongs_to :product

  def box_count_string
    return product.box_num_menu['options'][box_count.to_s.to_sym]
  end

  def frequency_string
    return product.delivery_frequency_menu['options'][frequency.to_s.to_sym]
  end

  def first_delivery_string
    return first_delivery.to_datetime.strftime("%A, %B %d")
  end

  def price
    return box_count * product.price
  end

  def price_string(zeroes)
    if zeroes
      return '$' + price.to_s.chop.chop + '.' + price.to_s.last(2)
    else
      return '$' + price.to_s.chop.chop
    end
  end
end
