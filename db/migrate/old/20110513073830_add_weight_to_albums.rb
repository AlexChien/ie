class AddWeightToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :weight, :integer, :default => 0
  end

  def self.down
    remove_column :albums, :weight
  end
end
