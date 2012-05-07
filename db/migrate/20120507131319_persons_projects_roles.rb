class PersonsProjectsRoles < ActiveRecord::Migration
  def change
    create_table :persons_projects_roles, :id => false do |t|
      t.integer :person_id
      t.integer :project_id
      t.integer :role_id
    end
  end
end
