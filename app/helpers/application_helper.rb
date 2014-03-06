module ApplicationHelper

  private
  def is_order_set?
    if !session[:order_id].nil?
      return true
    else
      return false
    end
  end


  def get_product
    if session[:product_id].present?
      return Product.find(session[:product_id])
    else
      return false
    end
  end

end
