desc "This task is called by the Heroku scheduler add-on"

task :ping_server => :environment do
  if Figaro.env.PING_URL
    puts "Pinging server at #{ENV['PING_URL']}"
    uri = URI(ENV['PING_URL'])
    h = Net::HTTP.get_response(uri)
    puts "Response: #{h.code} -- #{h.message}"
  end
end
