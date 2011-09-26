class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title_en
      t.string :title_zh_cn
      t.string :path
      t.date   :pubdate
      
      t.timestamps
    end
  end
end
