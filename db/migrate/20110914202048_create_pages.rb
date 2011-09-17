class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name_en
      t.string :name_zh_cn
      t.integer :parent_id
      t.string :path
      t.integer :template_id
      t.text :html_content
      t.text :html_content_en
      t.boolean :use_portlet, :default => false
      t.text :portlet_content
      t.timestamps
    end
  end
end
