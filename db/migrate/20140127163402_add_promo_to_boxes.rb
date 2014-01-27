class AddPromoToBoxes < ActiveRecord::Migration
  def change
    add_column :boxes, :promo, :string
  end
end
