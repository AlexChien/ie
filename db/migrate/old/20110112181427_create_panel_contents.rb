class CreatePanelContents < ActiveRecord::Migration
  def self.up
    create_table :panel_contents do |t|
      t.string :title
      t.text :description
      t.string :link
      t.boolean :is_published,:default=>false
      t.integer :weight,:default=>0
      t.integer :panel_category_id
      t.string :uploaded_data_file_name
      t.integer :uploaded_data_file_size
      t.integer :uploaded_data_height
      t.integer :uploaded_data_width
      t.datetime :uploaded_data_update_at
      t.string :uploaded_data_content_type
      t.timestamps
    end
  end

  def self.down
    drop_table :panel_contents
  end
end
