class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price, precision: 7, scale: 2
      t.references :farm, index: true

      t.timestamps
    end
  end
end
