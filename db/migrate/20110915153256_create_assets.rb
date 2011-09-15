class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :name
      t.integer :file_type, :default => 0
      t.string :uploaded_data_file_name
      t.string :uploaded_data_file_size
      t.datetime :uploaded_data_updated_at
      t.string :uploaded_data_content_type
      t.integer :resource_id
      t.string :resource_type
      t.timestamps
    end
  end
end
