class AddCheckboxesToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :text_me, :boolean
    add_column :boxes, :call_me, :boolean
  end
end
