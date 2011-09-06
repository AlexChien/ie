class AddMobileToUserModel < ActiveRecord::Migration
  def self.up
    add_column :users, :mobile, :string, :null => true
  end

  def self.down
    remove_column :users, :mobile
  end
end