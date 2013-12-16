class Box < ActiveRecord::Base
  validates :street, presence: true
  validates :box_num, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  validates :firstname, :length => { :maximum => 30 }
  validates :lastname, :length => { :maximum => 30 }
  validates :phone, presence: true
  validates :delivery_preference, presence: true
  validates :street, presence: true
  validates :zip, presence: true
  validates :city, presence: true
  validates :instructions, presence: true
  



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

  def get_price
    #add 400 for delivery
    if box_num == 1 
        return 2500;
      elsif box_num == 2
        return 2500;
      elsif box_num == 3
        return 2500;
      else
        return 2500;
      end
  end

end