# Get twilio-ruby from twilio.com/docs/ruby/install
require 'twilio-ruby'
 
# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'AC7f89cc329c591ff92476c2606459f215'
auth_token = '97abaf7b5f45920a2f1d767401d54d3d'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(
	:body => "www.farmivore.com/texts.   lol",
    :to => "+19018250094",
    :from => "+16474963276",
)
puts message.to + ' ' + message.status