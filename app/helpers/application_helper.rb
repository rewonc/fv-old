module ApplicationHelper

  private
  def is_order_set?
    if !session[:order_id].nil?
      return true
    else
      return false
    end
  end
end
