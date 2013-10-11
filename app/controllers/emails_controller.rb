class EmailsController < ApplicationController
		http_basic_authenticate_with name: "orange1", password: "orangutan", only: [:index]


	def create
	  @email = Email.new(email_params)
	  	if @email.save
		  flash[:notice] = 'Thanks for your input. We will contact you shortly.'
		  redirect_to root_path 
		else
			flash[:error] = 'Sorry, your data was invalid. Please try again. '
		  redirect_to root_path 
		end		
	end

	def index
		@emails = Email.all
	end

	private 
	def email_params
		params.require(:email).permit(:name, :email, :zip)
	end 
end
