class ConfirmMailer < ActionMailer::Base
  default from: "The Farmivore Team <rewon@farmivore.com>"

  def box_alert(order)
    @order = order
    mail(to: 'rewonc@gmail.com', subject: 'New confirmed order from ' + @order.fullname)
  end

end
