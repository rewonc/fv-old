class WelcomeController < ApplicationController

  def index
  end

  def farms
  end

  def team
  end

  def howitworks
  end

  def about
  end

  def features
  end

  def contact
  end

  def admin
  end

  def weekly_email
  end

  def referrer
    if !current_user.nil? && current_user.email === "rewonc@gmail.com" && params['id'] === "a67mm1"
      @users = User.where(:promocode_id => 1)
    else
      redirect_to root_path, alert: "You are not authorized to view this page."
    end
  end
  

end
