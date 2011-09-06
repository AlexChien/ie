class AddIssueTimeToArticle < ActiveRecord::Migration
  def self.up
    add_column :articles,:issue_time,:datetime
  end

  def self.down
    remove_column :articles,:issue_time
  end
end
