class AddColumnsToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :parent_id, :integer
    add_column :categories, :path, :string
    add_column :categories, :layout, :integer, :default => 0
    add_column :categories, :html_content, :text
    add_column :categories, :html_content_en, :text
    add_column :categories, :use_portlet, :boolean, :default => false
    add_column :categories, :portlet_content, :text
  end
end
