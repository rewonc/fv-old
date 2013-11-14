class BoxsController < ApplicationController
  def new
  end

  def create
    @box = Box.new(box_params)
    #TO DO: validations. return errors or save
    if @box.save
      flash[:notice] = 'Great! One last step and you are there!'
       @amount = @box.get_price
       session[:box_id] = @box.id
       render 'charges/new'
    else
      flash[:error] = 'Oops, looks like you left a field blank. Please try again.'
      render action: 'new'
    end   
   
  end

  private
    def box_params
      params.require(:box).permit(:box_num, :firstname, :lastname, :email, :phone, :frequency, :delivery_preference, :street, :street2, :city, :state, :zip, :instructions)
    end
end
