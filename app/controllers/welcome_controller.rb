class WelcomeController < ApplicationController

http_basic_authenticate_with name: "orange", password: "orangutan", only: [:admin]
 
  def index
  end

  def farmers
  end

  def about
  end

  def contact
  end
   
  def admin
  	@farms = Farm.all
  	@places = Place.all
  end

end
