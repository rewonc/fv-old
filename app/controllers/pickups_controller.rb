class PickupsController < ApplicationController

#we should route SHOW to display pickups for a specific place id, or a specific farm id, or details for one with two specified things.
# we should delete the address from here and code into a separate table so we don't get duplicates for places.farms and farms.places


http_basic_authenticate_with name: "orange", password: "orangutan", except: [:index, :show]
	
	def new
	end

	def create
	  @pickup = Pickup.new(pickup_params)
	  @pickup.save
	  redirect_to @pickup
	end

	def show
  		@pickup = Pickup.find(params[:id])
	end

	def index
		@pickup = Pickup.all
	end


	private
	  def pickup_params
	    params.require(:pickup).permit(:farm_id, :place_id, :address, :zip)
	  end


end
