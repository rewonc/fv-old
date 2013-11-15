class ChargesController < ApplicationController

	def index
	end

	def create
	  # Amount in cents
	  # https://stripe.com/docs/tutorials/charges  <-- on how to store the token and charge it later
	  @box = Box.find(session[:box_id])
		 amount = @box.get_price
	  @customer = Stripe::Customer.create(
	    :email => @box.email,
	    :description => 'Box Num: ' + @box.box_num.to_s + '. Deliver: ' + @box.startdate.to_s + '. Every: ' + @box.frequency.to_s + 'weeks',
	    :card  => params[:stripeToken]
	  )

	  @charge = Stripe::Charge.create(
	    :customer    => @customer.id,
	    :amount      => amount,
	    :description => @box.email.to_s,
	    :currency    => 'usd'
	  )


	  

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to charges_path

	end

end
