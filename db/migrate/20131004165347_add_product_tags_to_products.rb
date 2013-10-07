class AddProductTagsToProducts < ActiveRecord::Migration
  def change
  	remove_column :product_intervals, :attributes
  	add_column :product_intervals, :product_tags, :string
  end
end
