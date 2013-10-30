class ContactsController < ApplicationController
	http_basic_authenticate_with name: "orange1", password: "orangutan", only: [:index]

	def new
	end

	def create
	  @contact = Contact.new(contact_params)
	  	if @contact.save
		  flash[:notice] = 'All right, looks like you are all set! We will contact you soon with details on how to get started!'
		  redirect_to root_path 
		else
			flash[:error] = 'Oops, looks like you left a field blank. Please try again.'
		 	render action: 'new'
		end		
	end

	def index
		@contacts = Contact.all
	end

private 
	def contact_params
		params.require(:contact).permit(:firstname, :lastname, :email, :phone, :farmname, :markets, :produce)
	end 

end
