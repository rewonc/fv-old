class CreateProductIntervals < ActiveRecord::Migration
  def change
    create_table :product_intervals do |t|
      t.references :product, index: true
      t.integer :quantity
      t.decimal :base_price
      t.datetime :time_start
      t.datetime :time_end
      t.string :attributes

      t.timestamps
    end
  end
end
