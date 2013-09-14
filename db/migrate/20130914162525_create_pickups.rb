class CreatePickups < ActiveRecord::Migration
  def change
    create_table :pickups do |t|
 	  t.belongs_to :farm
 	  t.belongs_to :place
 	  t.string :address
 	  t.string :zip
      t.timestamps
    end
  end
end
