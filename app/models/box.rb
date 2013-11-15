class Box < ActiveRecord::Base
  validates :street, presence: true, if: "self.is_delivery?"
  validates :box_num, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :firstname, :length => { :maximum => 30 }
  validates :lastname, :length => { :maximum => 30 }
  validates :phone, presence: true
  validates :delivery_preference, presence: true
  validates :street, presence: true, if: "self.is_delivery?"
  validates :zip, presence: true, if: "self.is_delivery?"
  validates :city, presence: true, if: "self.is_delivery?"


  def delivery_preference_string
    #also update form boxes/new.html.erb
    if delivery_preference == 1
      return "Saturday morning between 9am-1pm"
    else
      return "Saturday afternoon between 1pm-5pm"
    end
  end

  def delivery_preference_time_string
    #also update form boxes/new.html.erb
    if delivery_preference == 1
      return "9am-1pm"
    else
      return "1pm-5pm"
    end
  end

  def is_delivery?
    if delivery_preference == 2 || delivery_preference == 1
      return true
    else
      return false
    end
  end

  def get_price
    #add 400 for delivery
    if box_num == 1 
        return 25;
      elsif box_num == 2
        return 25;
      elsif box_num == 3
        return 25;
      else
        return 25;
      end
  end

end