class MigrateTables < ActiveRecord::Migration
  def change
    rename_table :persons_projects_roles, :projects_roles_users
    rename_column :comments, :person_id, :user_id
    rename_column :projects_roles_users, :person_id, :user_id
    drop_table :people
    add_column :users, :phone, :string
  end
end
