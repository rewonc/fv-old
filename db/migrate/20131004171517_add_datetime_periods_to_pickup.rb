class AddDatetimePeriodsToPickup < ActiveRecord::Migration
  def change
  	add_column :pickups, :period, :string
  end
end
