class ChangeFirstDeliveryToDate < ActiveRecord::Migration
  def change
     
     change_column :orders, :first_delivery, 'date USING CAST(first_delivery AS date)'
  end
end

=begin
  
  Order.all.update_all(first_delivery: "2014-04-24")

=end