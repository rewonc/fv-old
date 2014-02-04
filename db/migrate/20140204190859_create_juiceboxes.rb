class CreateJuiceboxes < ActiveRecord::Migration
  def change
    create_table :juiceboxes do |t|
      t.integer :box_num
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :phone
      t.integer :frequency
      t.integer :delivery_preference
      t.string :street
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :instructions
      t.boolean  :text_me
      t.boolean  :call_me
      t.string   :promo
      t.timestamps
    end
  end
end
