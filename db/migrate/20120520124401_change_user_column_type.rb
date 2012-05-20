class ChangeUserColumnType < ActiveRecord::Migration
  def change
    rename_column :roles, :user_id, :name
    change_column :roles, :name, :string
  end
end
