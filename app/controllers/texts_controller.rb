class TextsController < ApplicationController
skip_before_filter :verify_authenticity_token	
  def catch 

    message_body = params["Body"]
    from_number = params["From"]
    @fromcity = params["FromCity"]
    @number = from_number
    SmsLogger.log_text_message(from_number, message_body)
    render :layout => false
  end

  def index
  	@texts = SmsLogger.all
  end

end
