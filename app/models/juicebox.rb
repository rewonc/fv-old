class Juicebox < ActiveRecord::Base

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
     if promo.strip.downcase == "goodroots2040"
      return "You secured the $20 for $40 discount, and will receive $20 off your first order."
     elsif promo.strip.downcase == "beets2000"
      return "You secured the $20 discount, and will receive $20 off your first order."
     elsif promo.strip.downcase == "carrot2000"
      return "You secured the $20 discount, and will receive $20 off your first order."
     elsif promo.strip.downcase == "lettuce2000"
      return "You secured the $20 discount, and will receive $20 off your first order."
     elsif promo.strip.downcase == "friendsnfam"
      return "You secured the $20 discount, and will receive $20 off your first order."
     elsif promo.strip.downcase == "eralovesveggies"
      return "You secured the $20 discount, and will receive $20 off your first order."
     else 
      return nil
    end
  end

  def box_price
   case box_num
      when 4
        price = 5000
      when 5
        price = 4500
      when 6
        price = 8000
    end

    #add some logic for delivery below a certain amount
    if (promo.strip.downcase == "goodroots2040")
      total = price - 2000
    elsif (promo.strip.downcase == "beets2000")
      total = price - 2000
    elsif (promo.strip.downcase == "carrot2000")
      total = price - 2000
    elsif (promo.strip.downcase == "lettuce2000")
      total = price - 2000
    elsif (promo.strip.downcase == "friendsnfam")
      total = price - 2000
    elsif (promo.strip.downcase == "eralovesveggies")
      total = price - 2000
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
      when 4
        box_name = "Single Juicing Box"
      when 5
        box_name = "Standard (7 pack) Juicing subscription"
      when 6
        box_name = "Jumbo (14 pack) Juicing subscription"
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
