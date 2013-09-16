class PickupsController < ApplicationController

#we should route SHOW to display pickups for a specific place id, or a specific farm id, or details for one with two specified things.
# we should add in time period & description.

http_basic_authenticate_with name: "orange", password: "orangutan", except: [:index, :show]
	
	def new
	end

	def edit
		@pickup = Pickup.find(params[:id])
	end


	def create
	  @pickup = Farm.find(params[:farm_id]).new_pickup
	  @pickup.assign_attributes(pickup_params)
	  @pickup.save
	  redirect_to @pickup.farm
	end

	def show
  		@pickup = Pickup.find(params[:id])
	end

	def index
		@farm = Farm.find(params[:farm_id])
		@pickups = @farm.pickups
	end

	def destroy
		@pickup = Pickup.find(params[:id])
		@pickup.destroy
		render 'index'
	end

	def update
		@pickup = Pickup.find(params[:id])
		@pickup.update_attributes(pickup_params)
		redirect_to @pickup.farm

	end

	private
	  def pickup_params
	    params.require(:pickup).permit(:place_id, :address, :zip)
	  end


end
