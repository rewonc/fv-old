class AddStartdateToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :startdate, :string
  end
end
