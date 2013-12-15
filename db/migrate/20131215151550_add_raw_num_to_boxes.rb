class AddRawNumToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :raw_num, :integer
    add_column :boxes, :cook_num, :integer
    add_column :boxes, :fruit_num, :integer
  end
end
