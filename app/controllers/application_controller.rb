class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :capture_referral
  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  

  private
  def capture_referral
    if params[:r]
      promocode = Promocode.where(code: params[:r])
      if promocode.length > 0
        session[:promocode_id] = promocode.take.id
      else
      end
    end

    if params[:p]
      product = Product.where(id: params[:p])
      if product.length > 0
        session[:product_id] = product.take.id
      else
      end
    end

  end

  protected
  def after_sign_in_path_for(resource)
    new_order_path
  end

  def configure_devise_permitted_parameters
    registration_params = [:first, :last, :email, :password, :password_confirmation, :zip, :promocode_id]

    if params[:action] == 'update'
      devise_parameter_sanitizer.for(:account_update) { 
        |u| u.permit(registration_params << :current_password)
      }
    elsif params[:action] == 'create'
      devise_parameter_sanitizer.for(:sign_up) { 
        |u| u.permit(registration_params) 
      }
    end
  end
end