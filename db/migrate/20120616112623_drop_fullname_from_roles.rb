class DropFullnameFromRoles < ActiveRecord::Migration
  def change
    remove_column :roles, :name
  end
end
