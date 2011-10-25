class AddIsPublishedToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :is_published, :boolean, :default => true

    add_index :jobs, :is_published

    # Job.reset_column_information
    Job.update_all(:is_published => true)
  end
end