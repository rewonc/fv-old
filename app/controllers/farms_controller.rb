class FarmsController < ApplicationController
 http_basic_authenticate_with name: "orange", password: "orangutan", except: [:index, :show]
	
	def new
	end

	def create
	  @farm = Farm.new(farm_params)
	  @farm.save
	  redirect_to @farm 
	end

	def edit
		@farm = Farm.find(params[:id])
	end

	def update
		@farm = Farm.find(params[:id])
		@farm.update_attributes(farm_params)
		redirect_to @farm
	end

	def show
  		@farm = Farm.find(params[:id])
  		@pickups = @farm.pickups
  		@products = @farm.products
	end

	def index
		@farms = Farm.all
	end

	def destroy
		@farm = Farm.find(params[:id])
		@farm.destroy
		respond_to do |format|
    	format.html { redirect_to(farms_url) }
    	format.xml  { head :ok }
  		end
	end


	private
	  def farm_params
	    params.require(:farm).permit(:title, :address, :state, :zip, :description, :logo)
	  end


end

