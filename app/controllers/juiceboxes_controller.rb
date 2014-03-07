class JuiceboxesController < ApplicationController
  before_action :set_juicebox, only: [:show, :edit, :update, :destroy]
  http_basic_authenticate_with name: "orange1", password: "orangutan", only: [:index, :show]
  # GET /juiceboxes
  # GET /juiceboxes.json
  def index
    @boxes = Juicebox.all
  end

  # GET /juiceboxes/1
  # GET /juiceboxes/1.json
  def show
  end

  # GET /juiceboxes/new
  def new
    @juicebox = Juicebox.new
  end

  # GET /juiceboxes/1/edit
  def edit
    if (session[:juicebox_id].to_s == params[:id])
      @juicebox = Juicebox.find(session[:juicebox_id])
    else
      flash[:error] = "You don't have permission to edit this. " + params[:id]
      redirect_to root_path
    end
  end

  # POST /juiceboxes
  # POST /juiceboxes.json
  def create
    @box = Juicebox.new(juicebox_params)

      if @box.save
        #ConfirmMailer.box_alert(@box).deliver
        session[:juicebox_id] = @box.id
        session[:box_id] = nil
        render 'charges/new', notice: 'Juicebox was successfully created.'
      else
        render action: 'new', notice: 'Order could not be saved'
      end

  end

  # PATCH/PUT /juiceboxes/1
  # PATCH/PUT /juiceboxes/1.json
  def update
    @box = Juicebox.find(params[:id])
    if @box.update(juicebox_params)
       session[:juicebox_id] = @box.id
       render 'charges/new'
    else
       render action: 'new'
    end
  end

  # DELETE /juiceboxes/1
  # DELETE /juiceboxes/1.json
  def destroy
    @juicebox.destroy
    respond_to do |format|
      format.html { redirect_to juiceboxes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_juicebox
      @juicebox = Juicebox.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def juicebox_params
      params.require(:juicebox).permit(:box_num, :firstname, :lastname, :email, :phone, :frequency, :delivery_preference, :street, :street2, :city, :state, :zip, :instructions, :startdate, :call_me, :text_me, :promo)
    end
end
