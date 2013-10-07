class RenameAttributeToProductTag < ActiveRecord::Migration
  def self.up
        rename_table :attributes, :product_tags
      end
     def self.down
        rename_table :product_tags, :attributes
     end
end
