class BoxesController < ApplicationController
  http_basic_authenticate_with name: "orange1", password: "orangutan", only: [:index, :show]

  def index
    require "uri"
    @boxes = Box.all
  end

  def show
    @box = Box.find(params[:id])
  end


  def new
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)
    #TO DO: validations. return errors or save
    if @box.save
       ConfirmMailer.box_alert(@box).deliver
       session[:box_id] = @box.id
       render 'charges/new'

    else
      render action: 'new'
    end   
   
  end

  def edit
    if (session[:box_id].to_s == params[:id])
      @box = Box.find(session[:box_id])
    else
      flash[:error] = "You don't have permission to edit this. " + params[:id]
      redirect_to root_path
    end
  end

  def update
    @box = Box.find(params[:id])
    if @box.update(box_params)
       session[:box_id] = @box.id
       render 'charges/new'
    else
       render action: 'new'
    end
  end

  def destroy
    @box = Box.find(params[:id])
    @box.destroy
    respond_to do |format|
      format.html { redirect_to boxes_url }
      format.json { head :no_content }
    end
  end


  private
    def box_params
      params.require(:box).permit(:box_num, :firstname, :lastname, :email, :phone, :frequency, :delivery_preference, :street, :street2, :city, :state, :zip, :instructions, :startdate, :call_me, :text_me, :raw_num, :cook_num, :fruit_num, :module_1, :module_2, :module_3, :module_4, :module_5, :module_6, :module_7, :no_list, :promo)
    end

end
