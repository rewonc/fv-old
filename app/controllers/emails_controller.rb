class EmailsController < ApplicationController
		http_basic_authenticate_with name: "orange1", password: "orangutan", only: [:index]


	def create
	  @email = Email.new(email_params)
	  	if @email.save
		  flash[:notice] = 'Thanks! We will email you when we have results for next week.'
		  redirect_to :back 
		else
			flash[:error] = 'Sorry, there was an error with your email. Please try again.'
		  redirect_to :back 
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
