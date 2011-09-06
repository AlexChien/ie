class AddWidthHeightToPanelCategory < ActiveRecord::Migration
  def self.up
    add_column :panel_categories, :rq_image, :boolean, :default => false
    add_column :panel_categories, :width, :integer, :default => 0
    add_column :panel_categories, :height, :integer, :default => 0
  end

  def self.down
    remove_column :panel_categories, :rq_image
    remove_column :panel_categories, :width
    remove_column :panel_categories, :height
  end
end
