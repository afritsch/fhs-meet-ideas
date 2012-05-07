class PersonsProjects < ActiveRecord::Migration
  def change
    create_table :persons_projects, :id => false do |t|
      t.integer :person_id
      t.integer :project_id
    end
  end
end