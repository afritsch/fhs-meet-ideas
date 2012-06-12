class AddFollowingTable < ActiveRecord::Migration
  def change
    create_table :projects_users
    add_column :projects_users, :project_id, :integer
    add_column :projects_users, :user_id, :integer
    add_index :projects_users, [:project_id, :user_id]
  end
end
