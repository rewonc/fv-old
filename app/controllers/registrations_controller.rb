class RegistrationsController < Devise::RegistrationsController
  respond_to :json
  def create
    params[:user][:password_confirmation] = params[:user][:password]
    super
  end
end