class ChargesController < ApplicationController
  before_filter :get_order, :only => [:new, :create, :edit, :update]
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update]
  http_basic_authenticate_with name: "admin", password: "RailsRAILS2014", only: [:index, :show, :destroy]
  #protect_from_forgery with: :null_session

  def index
  end

  def new
    render 'charges/new', layout: 'application'
  end

  def create
    @customer = Stripe::Customer.create(
      email: current_user.email,
      description: @order.product.name + '. ' + @order.product.price.to_s + '. ' + @order.box_count.to_s + ' boxes. ' + @order.first_delivery + '.  Freq:' + @order.frequency.to_s,
      card: allow_stripe_token
    )
    ConfirmMailer.box_alert(@order).deliver
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

  def allow_stripe_token
    params.require(:stripeToken)
  end


end
