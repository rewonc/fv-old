class Product < ActiveRecord::Base
  serialize :box_num_menu
  serialize :delivery_frequency_menu
  has_many :orders

  def is_affiliate?
    if id === 6
      return false
    else
      return true
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
  a.note = "3 days worth of produce is sent at one time. 6, 9, and 12 day reboots receive multiple shipments of produce."
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
  a.note = "This is a recurring subscription. You can pause, delay, or cancel your subscription at any time through your account settings."
  a.save

  a = Product.new
  a.name = "30 Day Challenge"
  a.id = 7
  boxnummenu = Hash.new
  dfreqmenu = Hash.new
  boxnummenu['title'] = 'Number of Weeks'
  boxnummenu['options'] = {:"1" => "4 weeks (4 deliveries)", :"2" => "1 week (1 delivery)", :"3" => "2 weeks (2 deliveries)", :"4" => "3 weeks (3 deliveries)"}
  dfreqmenu['title'] = 'Delivery frequency'
  dfreqmenu['options'] = {:"1" => "Once a week", :"2" => "Twice per week", :"3" => "Once every two weeks"}
  a.box_num_menu = boxnummenu
  a.delivery_frequency_menu = dfreqmenu
  a.price = 7800
  a.link = "http://partners.farmivore.com/30-day-challenge"
  a.note = "This is the price per week. You will be charged this amount each time you receive a delivery. You can skip, cancel, or pause shipments by letting us know 4 days in advance."
  a.save

  a = Product.new
  a.name = "30 Day Challenge"
  a.id = 7
  boxnummenu = Hash.new
  dfreqmenu = Hash.new
  boxnummenu['title'] = 'Number of Weeks'
  boxnummenu['options'] = {:"1" => "4 weeks (4 deliveries)", :"2" => "1 week (1 delivery)", :"3" => "2 weeks (2 deliveries)", :"4" => "3 weeks (3 deliveries)"}
  dfreqmenu['title'] = 'Delivery frequency'
  dfreqmenu['options'] = {:"1" => "Once a week", :"2" => "Twice per week", :"3" => "Once every two weeks"}
  a.box_num_menu = boxnummenu
  a.delivery_frequency_menu = dfreqmenu
  a.price = 7800
  a.link = "http://partners.farmivore.com/30-day-challenge"
  a.note = "This is the price per week. You will be charged this amount each time you receive a delivery. You can skip, cancel, or pause shipments by letting us know 4 days in advance."
  a.save

  a = Product.new
  a.name = "Green"
  a.id = 8
  boxnummenu = Hash.new
  boxnummenu['title'] = 'Boxes per delivery'
  boxnummenu['options'] = {:"1" => "1 box", :"2" => "2 boxes", :"3" => "3 boxes", :"4" => "4 boxes"}
  a.box_num_menu = boxnummenu
  a.price = 4500
  a.save

  a = Product.new
  a.name = "Classic"
  a.id = 9
  boxnummenu = Hash.new
  boxnummenu['title'] = 'Boxes per delivery'
  boxnummenu['options'] = {:"1" => "1 box", :"2" => "2 boxes", :"3" => "3 boxes", :"4" => "4 boxes"}
  a.box_num_menu = boxnummenu
  a.price = 4500
  a.save

  a = Product.new
  a.name = "Alternating"
  a.id = 10
  boxnummenu = Hash.new
  boxnummenu['title'] = 'Boxes per delivery'
  boxnummenu['options'] = {:"1" => "1 box", :"2" => "2 boxes", :"3" => "3 boxes", :"4" => "4 boxes"}
  a.box_num_menu = boxnummenu
  a.price = 4500
  a.save
  
=end
end
