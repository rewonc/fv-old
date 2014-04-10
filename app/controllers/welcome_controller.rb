class WelcomeController < ApplicationController


  def index
  end

  def admin
    if !(user_signed_in? && (current_user.email === "rewonc@gmail.com" || current_user.email === "raybears@gmail.com"))
      redirect_to :root, alert: "You don't have permission to access that page"
    end
    @orders = Order.all.select{|x| !x.charge.nil? }
  end

  def settings
    if !user_signed_in?
      redirect_to :root, alert: "Please sign in first"
    end
    @orders = current_user.orders.select{|x| !x.charge.nil? }
  end

  def referrer
    if user_signed_in?
      result = Promocode.where(email: current_user.email)
      if result.length > 0
        @promocode = result.take
      else
        redirect_to root_path, alert: "You are not authorized to view this page."
      end
    else
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end

 
end
