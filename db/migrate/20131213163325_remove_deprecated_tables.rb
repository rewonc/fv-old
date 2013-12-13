class RemoveDeprecatedTables < ActiveRecord::Migration
  def change
    drop_table :carts
    drop_table :contacts
    drop_table :emails
    drop_table :farmers
    drop_table :farms
    drop_table :interval_pickups
    drop_table :line_items
    drop_table :pickups
    drop_table :places
    drop_table :product_intervals
    drop_table :product_tags
    drop_table :products
  end
end
