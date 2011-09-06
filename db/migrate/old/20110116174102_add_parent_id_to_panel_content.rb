class AddParentIdToPanelContent < ActiveRecord::Migration
  def self.up
    add_column :panel_contents, :parent_id, :integer
  end

  def self.down
    remove_column :panel_contents, :parent_id
  end
end
