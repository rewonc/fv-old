class AddIntervalPickupReferenceToLineItem < ActiveRecord::Migration
  def change
  	remove_column :line_items, :product_id
  	add_column :line_items, :interval_pickup_id, :integer
  end
end
