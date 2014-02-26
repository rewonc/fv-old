class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.string :size
      t.string :price
      t.string :frequency
      t.string :plan
      t.string :price
      t.string :promocode
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :apt
      t.string :city
      t.string :state
      t.string :zip
      t.string :stripetoken
      t.integer :user_id

      t.timestamps
    end
  end
end
