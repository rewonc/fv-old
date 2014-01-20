class AddModulesToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :module_1, :integer
    add_column :boxes, :module_2, :integer
    add_column :boxes, :module_3, :integer
    add_column :boxes, :module_4, :integer
    add_column :boxes, :module_5, :integer
    add_column :boxes, :module_6, :integer
    add_column :boxes, :module_7, :integer
  end
end
