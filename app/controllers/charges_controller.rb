class ChargesController < ApplicationController

	def index
	end
	
	def new
		@amount = 1000;
	end

	def create
	  # Amount in cents
	  # https://stripe.com/docs/tutorials/charges  <-- on how to store the token and charge it later
	  # check that charge already exists before going through this
	  @amount = session[:amount]
	  @box = session[:box]

	  customer = Stripe::Customer.create(
	    :email => @box.email,
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount.to_i,
	    :description => @box.email.to_s,
	    :currency    => 'usd'
	  )

	  

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path

	end

end
