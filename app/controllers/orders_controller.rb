class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :new_order, only: [:create, :new]
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
    @order.fullname = current_user.first.to_s + ' ' + current_user.last.to_s
    @order.zip = current_user.zip
    #firstdate = Date.commercial(Date.today.year, 1+Date.today.cweek, 5)
    firstdate = "Wednesday, March 19"
    @order.first_delivery = firstdate
    @order.delivery_window = "Friday"
    @order.frequency = 1
    @order.box_count = 1
  end

  # GET /orders/1/edit
  def edit
    #authenticate
  end

  # POST /orders
  # POST /orders.json
  def create
    @order.attributes = order_params
    if !session[:promocode_id].nil?
      @order.promocode_id = session[:promocode_id]
    end

    respond_to do |format|
      if @order.save
        session[:order_id] = @order.id
        format.html { redirect_to new_charge_path}
        #format.json { render action: 'show', status: :created, location: @order }
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
        format.html { redirect_to new_charge_path, notice: 'Order was successfully updated.' }
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

    def new_order
      @order = Order.new
      @order.user = current_user
      #session[:product_id] = 5
      if session[:product_id].present?
        @order.product = Product.find(session[:product_id])
      else
        #set to default
        @order.product = Product.find(6)
      end

    end

    def referrer_params
      params.permit(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:box_count, :frequency, :fullname, :address1, :address2, :city, :state, :zip, :phone, :delivery_window, :first_delivery)
    end
end
