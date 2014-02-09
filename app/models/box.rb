class Box < ActiveRecord::Base
  validates :street, presence: true
  validates :box_num, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :frequency, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :delivery_preference, presence: true
  validates :street, presence: true
  validates :zip, presence: true
  validates :city, presence: true


  def promo_string
     #when editing promo codes -- remove from JUICEBOX as well as LOGIC below
     if promo.strip.downcase == "beets2000"
      return "You secured the $20 discount, and will receive $20 off your first order."
     elsif promo.strip.downcase == "carrot2000"
      return "You secured the $20 discount, and will receive $20 off your first order."
     elsif promo.strip.downcase == "lettuce2000"
      return "You secured the $20 discount, and will receive $20 off your first order."
     elsif promo.strip.downcase == "friendsnfam"
      return "You secured the $20 discount, and will receive $20 off your first order."
     elsif promo.strip.downcase == "eralovesveggies"
      return "You secured the $20 discount, and will receive $20 off your first order."
     elsif promo.strip.downcase == "sweetbeets1020"
      return "You secured a $10 discount, and will receive $10 off your first order."
     else 
      return nil
    end
  end

  def box_price
   case box_num
      when 1
        price = 4000
      when 2
        price = 3500
      when 3
        price = 6000
    end

    #add some logic for delivery below a certain amount
    if (promo.strip.downcase == "beets2000")
      total = price - 2000
    elsif (promo.strip.downcase == "carrot2000")
      total = price - 2000
    elsif (promo.strip.downcase == "lettuce2000")
      total = price - 2000
    elsif (promo.strip.downcase == "friendsnfam")
      total = price - 2000
    elsif (promo.strip.downcase == "eralovesveggies")
      total = price - 2000
    elsif (promo.strip.downcase == "sweetbeets1020")
      total = price - 1000
    else
      total = price
    end
    return total
  end

  def box_price_string(zeroes)
    if zeroes
      return '$' + self.box_price.to_s.chop.chop + '.' + self.box_price.to_s.last(2)
    else
      return '$' + self.box_price.to_s.chop.chop
    end
  end


  def frequency_string
    case frequency
      when 1
        return "weekly"
      when 2
        return "every 2 weeks"
      when 3
        return "every 3 weeks"
      when 4
        return "every month"
    end
  end


  def get_box_name
    case box_num
      when 1
        box_name = "Single Cooking Box"
      when 2
        box_name = "Standard Cooking Box subscription"
      when 3
        box_name = "Double Cooking Box subscription"
    end
    return box_name 
  end

  def delivery_preference_string
    case delivery_preference
      when 1
        return "No preference"
      when 2
        return "Saturday morning, 8am-10am"
      when 3
        return "Saturday lunch, 10am-12pm"
      when 4
        return "Saturday afternoon, 12pm-2pm"
      when 5
        return "Saturday evening, 3pm-5pm"
      else
        return "No preference"
    end
  end

end