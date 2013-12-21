class Box < ActiveRecord::Base
  validates :street, presence: true
  validates :box_num, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :delivery_preference, presence: true
  validates :raw_num, presence: true
  validates :cook_num, presence: true
  validates :fruit_num, presence: true
  validates :street, presence: true
  validates :zip, presence: true
  validates :city, presence: true
  validates :instructions, presence: true
  

  def get_box_name
    case box_num
      when 1
        box_name = "Raw and Ready"
      when 2
        box_name = "Culinary Box"
      when 3
        box_name = "Custom box"
    end
    return box_name #+ ', with ' + raw_num.to_s + ' raw pack/s, ' cook_num.to_s + ' culinary packs, and ' + fruit_num.to_s ' fruit packs.'
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

  def get_price
    modules = raw_num + cook_num + fruit_num
    subtotal = modules * 800
    if subtotal >= 4000
      total = subtotal
      return total
    else
      total = subtotal + 400
      return total
    end
  end

end