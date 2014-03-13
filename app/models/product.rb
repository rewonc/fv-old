class Product < ActiveRecord::Base
  serialize :box_num_menu
  serialize :delivery_frequency_menu
  has_many :orders

  def is_affiliate?
    if !id === 6
      return true
    else
      return false
    end
  end

=begin
  a = Product.new
  a.id = 5
  a.name = "Reboot with Joe"
  boxnummenu = Hash.new
  dfreqmenu = Hash.new
  boxnummenu['title'] = 'Number of days'
  boxnummenu['options'] = {:"1" => "3 days", :"2" => "6 days", :"3" => "9 days", :"4" => "12 days"}
  dfreqmenu['title'] = 'Recurring delivery'
  dfreqmenu['options'] = {:"1" => "No recurring delivery", :"2" => "Once every 2 weeks", :"3" => "Once every week"}
  a.box_num_menu = boxnummenu
  a.delivery_frequency_menu = dfreqmenu
  a.price = 11400
  a.link = "http://partners.farmivore.com/reboot-with-joe"
  a.note = "This is a one-time order. At the end of your experience, you can subscribe to a recurring Farmivore plan."
  a.save

  a = Product.new
  a.name = "Default"
  a.id = 6
  boxnummenu = Hash.new
  dfreqmenu = Hash.new
  boxnummenu['title'] = 'Number of juices'
  boxnummenu['options'] = {:"1" => "12 juices", :"2" => "24 juices"}
  dfreqmenu['title'] = 'Delivery frequency'
  dfreqmenu['options'] = {:"1" => "Once a week", :"2" => "Twice per week", :"3" => "Once every two weeks"}
  a.box_num_menu = boxnummenu
  a.delivery_frequency_menu = dfreqmenu
  a.price = 6000
  a.note = "This is a recurring subscription. You will receive a box according to the subscription preferences you set above. You can pause, delay, or cancel your subscription at any time through your account settings."
  a.save

  a = Product.new
  a.name = "30 Day Challenge"
  a.id = 7
  boxnummenu = Hash.new
  dfreqmenu = Hash.new
  boxnummenu['title'] = 'Number of people'
  boxnummenu['options'] = {:"1" => "1 person", :"2" => "2 people", :"3" => "3 people"}
  dfreqmenu['title'] = 'Delivery frequency'
  dfreqmenu['options'] = {:"1" => "Once a week", :"2" => "Twice per week", :"3" => "Once every two weeks"}
  a.box_num_menu = boxnummenu
  a.delivery_frequency_menu = dfreqmenu
  a.price = 7800
  a.link = "http://partners.farmivore.com/30-day-challenge"
  a.note = "This payment is for the first week of the challenge. You will be automatically enrolled for 3 weeks following the first week at $78 per week. You may pause, delay, or cancel the subsequent payments at any time through your account settings."
  a.save
  
=end
end
