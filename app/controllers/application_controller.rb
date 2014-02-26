class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :capture_referral

  private
  def capture_referral
    session[:referrer] = params[:referrer] if params[:referrer]
  end

end