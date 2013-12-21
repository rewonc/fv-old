class ChargesController < ApplicationController
  def index
    
  end

  def create
    # Amount in cents
    # https://stripe.com/docs/tutorials/charges  <-- on how to store the token and charge it later
    @box = Box.find(session[:box_id])
    amount = @box.get_price
    @customer = Stripe::Customer.create(
      email: @box.email,
      description: 'Modules:' + @box.raw_num.to_s + '-' + @box.cook_num.to_s + @box.fruit_num.to_s + '. Deliver: ' + @box.startdate.to_s + '. Every: ' + @box.frequency.to_s + 'weeks',
      card: params[:stripeToken]
    )

    @charge = Stripe::Charge.create(
      customer: @customer.id,
      amount: amount,
      description: @box.email.to_s,
      currency: 'usd'
    )
    render 'charges/create', layout: 'application'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :back
  end

end
