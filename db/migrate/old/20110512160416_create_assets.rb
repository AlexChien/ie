class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.string :photo_file_name
      t.integer :photo_file_size
      t.datetime :photo_updated_at
      t.string :photo_content_type
      t.integer :resource_id
      t.string :resource_type
      t.string :name
      t.text :memo
      t.integer :photo_type,:default=>0
      t.integer :weight,:default=>0
      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
