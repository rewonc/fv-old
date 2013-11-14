class BoxsController < ApplicationController
  def new
  end

  def create
    @box = Box.new(box_params)
    #TO DO: validations, and return errors
    
    if @box.box_num == 1 
      @amount = 2100;
    elsif @box.box_num == 2
      @amount = 2400;
    elsif @box.box_num == 3
      @amount = 2900;
    else
      @amount = 3100;
    end

    render 'charges/new'
  end


  private
    def box_params
      params.require(:box).permit(:box_num, :firstname, :lastname, :email, :phone, :frequency, :delivery_preference, :street, :street2, :city, :state, :zip, :instructions)
    end
end
