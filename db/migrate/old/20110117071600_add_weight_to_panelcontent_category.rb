class AddWeightToPanelcontentCategory < ActiveRecord::Migration
  def self.up
    add_column :panel_categories, :weight, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :panel_categories, :weight
  end
end