class AddNamesToFarmer < ActiveRecord::Migration
  def change
  	add_column :farmers, :first_name, :string
  	add_column :farmers, :last_name, :string
  	add_column :farmers, :age, :integer
  end
end
