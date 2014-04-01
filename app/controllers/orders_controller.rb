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
    @order.delivery_window = 4
    @order.frequency = 4
    @order.box_count = 1
    @order.first_delivery = Order.fd_date(@order.delivery_window, 1)
    
  end

  # GET /orders/1/edit
  def edit
    #authenticate_user
    if !(set_order.user.id === current_user.id)
      redirect_to :root, alert: "You don't have access to that record."
    end
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

      if !session[:order_id].nil?
        @order = Order.find(session[:order_id])
        @order.product = Product.find(session[:product_id]) if !session[:product_id].nil?
        render 'edit'
      end

      @order = Order.new
      @order.user = current_user
      if session[:product_id].present?
        @order.product = Product.find(session[:product_id])
      else
        @order.product = Product.find(9)
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
