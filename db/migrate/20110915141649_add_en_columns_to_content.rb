class AddEnColumnsToContent < ActiveRecord::Migration
  def change
    add_column :contents, :title_en, :string
    add_column :contents, :source_en, :string
    add_column :contents, :desc_en, :text
  end
end
