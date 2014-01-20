class Box < ActiveRecord::Base
  validates :street, presence: true
  #validates :box_num, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :frequency, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :delivery_preference, presence: true
  #validates :raw_num, presence: true
  #validates :cook_num, presence: true
  #validates :fruit_num, presence: true
  validates :street, presence: true
  validates :zip, presence: true
  validates :city, presence: true
  validates :module_1, presence: true
  validates :module_2, presence: true
  validates :module_3, presence: true
  validates :module_4, presence: true
  validates :module_5, presence: true
  validates :module_6, presence: true
  #validates :module_7, presence: true

  

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
        box_name = "Raw Box"
      when 2
        box_name = "Variety Box"
      when 3
        box_name = "Custom Box"
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
    if raw_num.blank?
      return 4000
    else
      modules = raw_num + cook_num + fruit_num
      subtotal = modules * 800
      if subtotal.nil?
        return 'nil'
      end
      if subtotal >= 4000
        total = subtotal
        return total
      else
        total = subtotal + 400
        return total
      end
    end
  end

  def get_price_string
    return '$' + get_price.to_s.chop.chop + '.' + get_price.to_s.last(2)
  end


end