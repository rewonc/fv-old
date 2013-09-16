class ProductsController < ApplicationController

http_basic_authenticate_with name: "orange", password: "orangutan", except: [:index, :show]
	
	def new
	end

	def edit
		@product = Product.find(params[:id])
	end


	def create
	  @product = Farm.find(params[:farm_id]).new_product
	  @product.assign_attributes(product_params)
	  @product.save
	  redirect_to @product.farm
	end

	def show
  		@product = Product.find(params[:id])
	end

	def index
		@farm = Farm.find(params[:farm_id])
		@products = @farm.products
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		respond_to do |format|
    	format.html { redirect_to(farms_url) }
    	format.xml  { head :ok }
  		end
	end

	def update
		@product = Product.find(params[:id])
		@product.update_attributes(product_params)
		redirect_to @product.farm

	end

	private
	  def product_params
	    params.require(:product).permit(:title, :description, :price)
	  end


end
