class AddNoListToBoxes < ActiveRecord::Migration
  def change
      add_column :boxes, :no_list, :string
  end
end
