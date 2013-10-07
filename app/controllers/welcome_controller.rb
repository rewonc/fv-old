class WelcomeController < ApplicationController
 
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
