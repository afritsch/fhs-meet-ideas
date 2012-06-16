class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :studypath, :string
  end
end
