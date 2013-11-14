class ChargesController < ApplicationController

	def index
	end
	
	def new
		@amount = 1000;
	end

	def create
	  # Amount in cents
	  # https://stripe.com/docs/tutorials/charges  <-- integrating the charge
	  @amount = @cart.total * 100

	  customer = Stripe::Customer.create(
	    :email => 'example@stripe.com',
	    :card  => params[:stripeToken]
	  )

	  charge = Stripe::Charge.create(
	    :customer    => customer.id,
	    :amount      => @amount.to_i,
	    :description => 'Rails Stripe customer',
	    :currency    => 'usd'
	  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path

	end

end
