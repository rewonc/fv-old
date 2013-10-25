class TextsController < ApplicationController
skip_before_filter :verify_authenticity_token	
  def catch 

    message_body = params["Body"]
    from_number = params["From"]

    SmsLogger.log_text_message(from_number, message_body)
  end

  def index
  	@texts = SmsLogger.all
  end

end
