class ChargesController < ApplicationController
  def index
    
  end

  def create
    # Amount in cents
    # https://stripe.com/docs/tutorials/charges  <-- on how to store the token and charge it later
    @box = Box.find(session[:box_id])
    amount = @box.box_price
    @customer = Stripe::Customer.create(
      email: @box.email,
      description: 'Modules:' + @box.module_1.to_s + '-' + @box.module_2.to_s + '-' + @box.module_3.to_s + '-' + @box.module_4.to_s + '-' + @box.module_5.to_s + '-' + @box.module_6.to_s + '. Deliver: ' + @box.startdate.to_s + '. ' + @box.frequency_string + '.',
      card: params[:stripeToken]
    )

    #@charge = Stripe::Charge.create(
    #  customer: @customer.id,
    #  amount: amount,
    #  description: @box.email.to_s,
    #  currency: 'usd'
    #)
    
    render 'charges/create', layout: 'application'

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to :back
  end

end
