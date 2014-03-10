class AddPromocodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :promocode_id, :integer
  end
end
