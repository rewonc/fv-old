class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :title
      t.string :address
      t.string :state
      t.string :zip
      t.text :description
      t.timestamps
    end
  end
end
