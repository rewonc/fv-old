class NewColumnsForShift < ActiveRecord::Migration
  def change
  	remove_column :products, :price
    change_column :product_intervals, :base_price, :integer
  	add_column :pickups, :description, :string
  	add_column :pickups, :latitude, :string
  	add_column :pickups, :longitude, :string
  	add_column :charges, :cart_id, :integer
  	add_column :carts, :active, :boolean
  	add_column :carts, :paid, :boolean
  end
end
