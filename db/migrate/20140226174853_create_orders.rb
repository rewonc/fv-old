class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :box_count
      t.integer :frequency
      t.string :fullname
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :delivery_window
      t.string :first_delivery
      t.references :user
      t.references :product
      t.references :promocode
      t.timestamps
    end
  end
end
