class ConfirmMailer < ActionMailer::Base
  default from: "The Farmivore Team <rewon@farmivore.com>"

  def box_alert(box)
    @box = box
    mail(to: 'rewonc@gmail.com', subject: 'New order from ' + @box.firstname + ' ' + @box.lastname)
  end

end
