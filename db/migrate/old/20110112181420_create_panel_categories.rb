class CreatePanelCategories < ActiveRecord::Migration
  def self.up
    create_table :panel_categories do |t|
      t.string :name
      t.integer :parent_id
      t.text :memo
      t.timestamps
    end

    PanelCategory.create(:name=>"焦点图")
    PanelCategory.create(:name=>"本期精华")
    PanelCategory.create(:name=>"最新鉴赏")
    PanelCategory.create(:name=>"读编往来")
    PanelCategory.create(:name=>"在线投票")
  end

  def self.down
    drop_table :panel_categories
  end
end
