class Box < ActiveRecord::Base

def get_price
  #add 400 for delivery
  if box_num == 1 
      return 2100;
    elsif box_num == 2
      return 2400;
    elsif box_num == 3
      return 2900;
    else
      return 3100;
    end

end

end
