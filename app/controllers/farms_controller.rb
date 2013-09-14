class FarmsController < ApplicationController
 http_basic_authenticate_with name: "orange", password: "orangutan", except: [:index, :show]
	
	def new
	end

	def create
	  @farm = Farm.new(farm_params)
	  @farm.save
	  redirect_to @farm
	end

	def show
  		@farm = Farm.find(params[:id])
	end

	def index
		@farms = Farm.all
	end


	private
	  def farm_params
	    params.require(:farm).permit(:title, :address, :state, :zip, :description)
	  end


end

