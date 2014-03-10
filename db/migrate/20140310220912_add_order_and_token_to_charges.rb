class AddOrderAndTokenToCharges < ActiveRecord::Migration
  def change
    add_reference :charges, :order, index: true
    add_column :charges, :token, :string
  end
end
