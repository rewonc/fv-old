class CreateDeliveries < ActiveRecord::Migration
  def change
    create_table :deliveries do |t|
      t.date :shipping_date
      t.boolean :active
      t.references :order, index: true

      t.timestamps
    end
  end
end
