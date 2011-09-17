class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :title
      t.integer :page_id
      t.date :issue_date
      t.integer :link_type,:default=>0
      t.string :source
      t.string :source_link
      t.text :desc
      t.timestamps
    end
  end
end
