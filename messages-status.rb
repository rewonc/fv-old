require 'twilio-ruby'

account_sid = 'AC7f89cc329c591ff92476c2606459f215'
auth_token = '97abaf7b5f45920a2f1d767401d54d3d'
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.list.each do |message|
    puts message.body + ' - ' + message.status + ' ///  '
end