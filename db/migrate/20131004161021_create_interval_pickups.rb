class CreateIntervalPickups < ActiveRecord::Migration
  def change
    create_table :interval_pickups do |t|
      t.references :product_interval, index: true
      t.references :pickup, index: true
      t.integer :processing_time
      t.integer :charge
      t.integer :charge1
      t.integer :charge2

      t.timestamps
    end
  end
end
