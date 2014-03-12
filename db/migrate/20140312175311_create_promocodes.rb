class CreatePromocodes < ActiveRecord::Migration
  def change
    create_table :promocodes do |t|
      t.string :code
      t.string :email

      t.timestamps
    end
  end
end
