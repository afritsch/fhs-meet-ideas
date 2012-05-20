class ChangeNameColumns < ActiveRecord::Migration
  def change
    remove_column :users, :firstname
    remove_column :users, :lastname
    add_column :users, :fullname, :string
  end
end
