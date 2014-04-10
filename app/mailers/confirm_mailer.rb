class ConfirmMailer < ActionMailer::Base
  default from: "The Farmivore Team <orders@farmivore.com>"

  def box_alert(order)
    @order = order
    mail(to: 'orders@farmivore.com', subject: @order.fullname + 's order. ' + @order.product.name + '. ' + @order.total_string(true) + '. ' + @order.box_count_string + '. ' + @order.first_delivery_string + '. ' + @order.frequency_string)
  end

  def welcome(order)
    @order = order
    mail(to: order.user.email, subject: 'Welcome to Farmivore, ' + @order.user.first)
  end
end
