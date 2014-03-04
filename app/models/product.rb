class Product < ActiveRecord::Base
  serialize :box_num_menu
  serialize :delivery_frequency_menu
  has_many :orders

=begin
  a = Product.new
  a.name = "Reboot with Joe"
  boxnummenu = Hash.new
  dfreqmenu = Hash.new
  boxnummenu['title'] = 'Number of days'
  boxnummenu['options'] = {:"1" => "2 days", :"2" => "4 days", :"3" => "6 days"}
  dfreqmenu['title'] = 'Recurring delivery'
  dfreqmenu['options'] = {:"1" => "No recurring delivery", :"2" => "Once every 2 weeks", :"3" => "Once every week"}
  a.box_num_menu = boxnummenu
  a.delivery_frequency_menu = dfreqmenu
  a.price = 7400
  a.save

  a = Product.new
  a.name = "Default"
  boxnummenu = Hash.new
  dfreqmenu = Hash.new
  boxnummenu['title'] = 'Number of juices'
  boxnummenu['options'] = {:"1" => "12 juices", :"2" => "24 juices"}
  dfreqmenu['title'] = 'Delivery frequency'
  dfreqmenu['options'] = {:"1" => "Once a week", :"2" => "Twice per week", :"3" => "Once every two weeks"}
  a.box_num_menu = boxnummenu
  a.delivery_frequency_menu = dfreqmenu
  a.price = 6000
  a.save
  
=end
end
