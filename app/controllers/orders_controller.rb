class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update]
  http_basic_authenticate_with name: "admin", password: "RailsRAILS2014", only: [:index, :show, :destroy]


  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    #@name = referrer_params['name']
    #hardcode some variables for the sake of now
    #@name = 'joe3day'
    #session[:referrer] = '10e8hez'
    #session[:order_id] = 'blahblah'
    #some code here to get name, price, and other code for view from the model
    #if user_signed_in?
    #  @registered = true
    #else
    #  @registered = false
    #end
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
    #authenticate
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    user_id = current_user[:id]
    #ref_id = session[:referrer] if session[:referrer]
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def referrer_params
      params.permit(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :size, :price, :frequency, :plan, :price, :promocode, :firstname, :lastname, :address, :apt, :city, :state, :zip, :stripetoken, :user_id)
    end
end
