class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :category_id
      t.string :title
      t.text :content
      t.boolean :is_published,:default=>false
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
