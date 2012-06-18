class CreatePredefinedRoles < ActiveRecord::Migration
  def change
    create_table :predefined_roles do |t|
      t.string :role
    end
  end
end
