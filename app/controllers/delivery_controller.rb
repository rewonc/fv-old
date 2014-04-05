class DeliveryController < ApplicationController

  def activate_order(order)

    order.active = true
    
    respond_to do |format|
      if order.save
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def activate_order(order)
    #order.
  end

end
