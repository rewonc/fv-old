class ChangeDeliveryWindowToInteger < ActiveRecord::Migration
  def change
    
    change_column :orders, :delivery_window, 'integer USING CAST(delivery_window AS integer)'
  end
end

=begin
  
  Order.all.update_all(delivery_window: 4)

=end