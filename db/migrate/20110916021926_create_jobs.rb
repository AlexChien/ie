class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_name
      t.string :job_name_en
      t.integer :department_id
      t.integer :job_type, :integer, :default => 0
      t.text :responsibility
      t.text :requirement
      t.timestamps
    end
  end
end
