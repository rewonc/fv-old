class ChargesController < ApplicationController
  def index
  end

  def new
  end

  def create
    # Amount in cents
    # https://stripe.com/docs/tutorials/charges  <-- on how to store the token and charge it later
    if session[:box_id].nil? && !session[:juicebox_id].nil?
      @box = Juicebox.find(session[:juicebox_id])
    elsif !session[:box_id].nil? && session[:juicebox_id].nil?
      @box = Box.find(session[:box_id])
    else
      return redirect_to :root, notice: "Your application appears to come from an unauthorized source. Our apologies for this inconvenience. Please contact support@farmivore.com to register for an account."
    end
     
    amount = @box.box_price
    @customer = Stripe::Customer.create(
      email: @box.email,
      description: @box.get_box_name + ' . Deliver: ' + @box.startdate.to_s + '. ' + @box.frequency_string + '.',
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
