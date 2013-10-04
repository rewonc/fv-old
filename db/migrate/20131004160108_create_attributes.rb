class CreateAttributes < ActiveRecord::Migration
  def change
    create_table :attributes do |t|
      t.references :product, index: true
      t.string :options
      t.string :title

      t.timestamps
    end
  end
end
