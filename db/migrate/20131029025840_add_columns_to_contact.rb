class AddColumnsToContact < ActiveRecord::Migration
  def up
  	add_column :contacts, :firstname, :string
  	add_column :contacts, :lastname, :string
  	add_column :contacts, :email, :string
  	add_column :contacts, :phone, :string
  	add_column :contacts, :farmname, :string
  	add_column :contacts, :markets, :string
  	add_column :contacts, :produce, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
