class SmsLogger < ActiveRecord::Base
	def self.log_text_message(from_number, message_body)
		SmsLogger.create(body: message_body, from: from_number)
	end
end
