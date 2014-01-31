class ZipcodesController < ApplicationController
  def create
    @zip_mailer = params['zipcode']

    ConfirmMailer.zipcode_confirmation(@zip_mailer).deliver

    flash['notice'] = "thanks"
    redirect_to :root
  end
end
