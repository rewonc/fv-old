class AddNeighborhoodToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :neighborhood, :string
  end
end
