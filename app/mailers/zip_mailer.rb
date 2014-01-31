class ZipMailer < ActionMailer::Base
  default from: "brainwireg@gmail.com"
  def zip_email_confirmation(zip_mailer)
   recipents zip_mailer
   from    "bdj19@hotmail.com"
   subject "Thanks from farmivore"
   body     :zip_mailer => zip_mailer
end
end
