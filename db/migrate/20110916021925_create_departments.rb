class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name_en
      t.string :name_zh_cn
      t.timestamps
    end
  end
end
