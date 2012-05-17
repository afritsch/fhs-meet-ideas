class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :users, :surname, :lastname
  end
end
