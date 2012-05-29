class AddIndices < ActiveRecord::Migration
  def change
    add_index :appointments, :project_id
    add_index :comments, [:project_id, :user_id]
    add_index :pictures, :project_id
    add_index :projects, :user_id
    add_index :roles, :project_id
  end
end
