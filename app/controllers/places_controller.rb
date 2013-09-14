class PlacesController < ApplicationController
   http_basic_authenticate_with name: "orange", password: "orangutan", except: [:index, :show]

  def index
  	@places = Place.all
  end

  def new
  end

  def create
  	@place = Place.new(place_params)
	  @place.save
	  redirect_to @place
  end

  def show
  	@place = Place.find(params[:id])
    @farms = @place.farms
  end

  private
	  def place_params
	    params.require(:place).permit(:title, :state)
	  end
end
