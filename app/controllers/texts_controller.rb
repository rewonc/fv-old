class TextsController < ApplicationController
skip_before_filter :verify_authenticity_token
  def catch

    message_body = params["Body"]
    from_number = params["From"]
    @fromcity = params["FromCity"]
    if from_number == "+17754121514"
    	@name = "Rewon"
    elsif from_number == "+15707987565"
    	@name = "Sherwin"
    elsif from_number == "+!9018250094"
    	@name = "Ray"
    else
    	@name = "Good ol... what was your name again?"
    end
    SmsLogger.log_text_message(from_number, message_body)
    render :layout => false
  end

  def index
  	@texts = SmsLogger.all
  end

end
