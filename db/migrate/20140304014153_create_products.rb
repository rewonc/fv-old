class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :box_num_menu
      t.text :delivery_frequency_menu
      t.timestamps
    end
  end
end
