class BoxesController < ApplicationController
  http_basic_authenticate_with name: "orange1", password: "orangutan", only: [:index]

  def index
    @boxes = Box.all
  end

  def new
    @box = Box.new
  end

  def create
    @box = Box.new(box_params)
    #TO DO: validations. return errors or save
    if @box.save
       @amount = @box.get_price
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
        @amount = @box.get_price
       session[:box_id] = @box.id
       render 'charges/new'
    else
       render action: 'new'
    end
  end



  private
    def box_params
      params.require(:box).permit(:box_num, :firstname, :lastname, :email, :phone, :frequency, :delivery_preference, :street, :street2, :city, :state, :zip, :instructions, :startdate, :call_me, :text_me, :raw_num, :cook_num, :fruit_num)
    end

end
