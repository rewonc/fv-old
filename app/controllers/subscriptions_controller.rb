
class SubscriptionsController < ApplicationController
  before_action :set_subscription, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :new_subscription, only: [:create, :new]
  http_basic_authenticate_with name: "admin", password: "RailsRAILS2014", only: [:index, :show, :destroy]


  # GET /Subscriptions
  # GET /Subscriptions.json
  def index
    @subscriptions = Subscription.all
  end

  # GET /Subscriptions/1
  # GET /Subscriptions/1.json
  def show
  end

  # GET /Subscriptions/new
  def new
    @subscription.fullname = current_user.first.to_s + ' ' + current_user.last.to_s
    @subscription.zip = current_user.zip
    #firstdate = Date.commercial(Date.today.year, 1+Date.today.cweek, 5)
    firstdate = "Wednesday, March 19"
    @subscription.first_delivery = firstdate
    @subscription.delivery_window = "Friday"
    @subscription.frequency = 1
    @subscription.box_count = 1
  end

  # GET /Subscriptions/1/edit
  def edit
    #authenticate
  end

  # POST /Subscriptions
  # POST /Subscriptions.json
  def create
    @subscription.attributes = subscription_params
    if !session[:promocode_id].nil?
      @subscription.promocode_id = session[:promocode_id]
    end

    respond_to do |format|
      if @subscription.save
        session[:subscription_id] = @subscription.id
        format.html { redirect_to new_charge_path}
        #format.json { render action: 'show', status: :created, location: @Subscription }
      else
        format.html { render action: 'new' }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Subscriptions/1
  # PATCH/PUT /Subscriptions/1.json
  def update
    respond_to do |format|
      if @subscription.update(subscription_params)
        format.html { redirect_to new_charge_path, notice: 'Subscription was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Subscriptions/1
  def destroy
    @subscription.destroy
    respond_to do |format|
      format.html { redirect_to subscriptions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscription
      @subscription = Subscription.find(params[:id])
    end

    def new_subscription
      @subscription = Subscription.new
      @subscription.user = current_user
      #session[:product_id] = 5
      if session[:product_id].present?
        @subscription.product = Product.find(session[:product_id])
      else
        #set to default
        @subscription.product = Product.find(6)
      end

    end

    def referrer_params
      params.permit(:name)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:box_count, :frequency, :fullname, :address1, :address2, :city, :state, :zip, :phone, :delivery_window, :first_delivery)
    end
end
