class DropMegaJoinTable < ActiveRecord::Migration
  def change
    drop_table :projects_roles_users
  end
end
