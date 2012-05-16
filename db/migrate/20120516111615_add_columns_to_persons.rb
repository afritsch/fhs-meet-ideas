class AddColumnsToPersons < ActiveRecord::Migration
  def change
    add_column :people, :provider, :string
    add_column :people, :uid, :string
    add_column :people, :name, :string
  end
end
