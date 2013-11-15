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

  private
    def box_params
      params.require(:box).permit(:box_num, :firstname, :lastname, :email, :phone, :frequency, :delivery_preference, :street, :street2, :city, :state, :zip, :instructions)
    end
end
