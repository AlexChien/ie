class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.string :authorizable_type
      t.integer :authorizable_id
      t.timestamps
    end

    admin = Role.create(:name=>"admin")
    member = Role.create(:name=>"member")

    create_table :roles_users, :id => false, :force => true do |t|
      t.references :user
      t.references :role
      t.timestamps
    end
    add_index :roles_users, :role_id
    add_index :roles_users, [:user_id, :role_id], :unique => true

    User.all.each do |user|
      user.roles << member
    end

  end

  def self.down
    drop_table :roles
    drop_table :roles_users
  end
end
