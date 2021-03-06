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
  #belongs_to :promocode
  has_one :charge
  has_many :deliveries
  
  def box_count_string
    return product.box_num_menu['options'][box_count.to_s.to_sym]
  end

  def frequency_string
    #calculated in number of deliveries per month
    case frequency
      when 8
        return "Twice per week"
      when 4
        return "Once per week"
      when 2
        return "Once per two weeks"
      else
        return "Undefined"
      end
  end

  def delivery_window_string
    case frequency
      when 1
        return "Monday"
      when 2
        return "Tuesday"
      when 3
        return "Wednesday"
      when 4
        return "Thursday"
      when 5
        return "Friday"
      when 6
        return "Saturday"
      when 7
        return "Sunday"
      else
        return "Undefined"
      end
  end

  def first_delivery_string
    return first_delivery.strftime("%A, %B %d")
  end

  def price
    if promocode_id.nil?
      return box_count * product.price
    else
      return promocodeDiscount(box_count, product.price, promocode_id)
    end
  end

  def price_string(zeroes)
    if zeroes
      return '$' + price.to_s.chop.chop + '.' + price.to_s.last(2)
    else
      return '$' + price.to_s.chop.chop
    end
  end

  def shipping
    if product.shipping.nil?
      product.shipping = 0
    end
    return box_count * product.shipping
  end

  def shipping_string(zeroes)
    if zeroes
      return '$' + shipping.to_s.chop.chop + '.' + shipping.to_s.last(2)
    else
      return '$' + shipping.to_s.chop.chop
    end
  end

  def total
    return price + shipping
  end

  def total_string(zeroes)
    if zeroes
      return '$' + total.to_s.chop.chop + '.' + total.to_s.last(2)
    else
      return '$' + total.to_s.chop.chop
    end
  end

  def self.fd_date(day, weeksFromToday)
    return Date.commercial(Date.today.year, weeksFromToday+Date.today.cweek, day)
  end

  def self.fd_date_string(day, weeksFromToday)
    return fd_date(day, weeksFromToday).strftime("%A, %B %d")
  end

  def self.price_string(integer)
    return '$' + integer.to_s.chop.chop + '.' + integer.to_s.last(2)
  end

  def promocodeDiscount(boxcount, price, id)
    case id
      when 67107392
        #5% discount off 39.95
        price = 3795
      when 1500531954
        price = 3595
      when -1719724056
        price = 3196
      when 2132219500
        price = 3495
      when -190114793
        price = 2995
      when -1731342558
        price = 1995  
      else
        price = price
    end

    return boxcount * price
      
  end

end
