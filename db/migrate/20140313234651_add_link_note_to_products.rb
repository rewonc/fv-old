class AddLinkNoteToProducts < ActiveRecord::Migration
  def change
    add_column :products, :link, :string
    add_column :products, :note, :string
  end
end
