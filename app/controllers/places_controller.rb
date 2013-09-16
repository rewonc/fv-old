class PlacesController < ApplicationController
   http_basic_authenticate_with name: "orange", password: "orangutan", except: [:index, :show]

  def index
  	@places = Place.all
  end

  def new
  end

  def edit
        @place = Place.find(params[:id])
  end


  def create
  	@place = Place.new(place_params)
	  @place.save
	  redirect_to @place
  end

  def show
  	@place = Place.find(params[:id])
    @farms = @place.farms.uniq
    @pickups = @place.pickups
    @products = @place.products.uniq
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
      end
  end

  def update
    @place = Place.find(params[:id])
    @place.update_attributes(place_params)
    redirect_to @place
  end

  private
	  def place_params
	    params.require(:place).permit(:title, :state)
	  end
end
