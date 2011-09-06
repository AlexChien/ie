class AddTargetTypeToPanelContent < ActiveRecord::Migration
  def self.up
    add_column :panel_contents, :target_type, :integer, :default => 0
  end

  def self.down
    remove_column :panel_contents, :target_type
  end
end
