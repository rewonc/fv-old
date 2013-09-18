class AddLogoColumnsToFarms < ActiveRecord::Migration
  def self.up
    add_attachment :farms, :logo
  end

  def self.down
    remove_attachment :farms, :logo
  end
end
