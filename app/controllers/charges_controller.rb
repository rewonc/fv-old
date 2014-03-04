class ChargesController < ApplicationController
  before_filter :get_order, :only => [:new, :create, :edit, :update]
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update]
  http_basic_authenticate_with name: "admin", password: "RailsRAILS2014", only: [:index, :show, :destroy]

  def index
  end

  def new
    render 'charges/new', layout: 'application'
  end

  def create
    
    if session[:box_id].nil? && !session[:juicebox_id].nil?
      @box = Juicebox.find(session[:juicebox_id])
    elsif !session[:box_id].nil? && session[:juicebox_id].nil?
      @box = Box.find(session[:box_id])
    else
      return redirect_to :back, notice: "Your application appears to come from an unauthorized source. Our apologies for this inconvenience. Please contact support@farmivore.com to register for an account."
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

  private

  def get_order
    if session[:order_id].present?
      @order = Order.find(session[:order_id])
    else
      redirect_to :root, notice: "Your application appears to come from an unauthorized source. Please contact support@farmivore.com for assistance."
    end
  end


end
