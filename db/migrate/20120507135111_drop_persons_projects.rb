class DropPersonsProjects < ActiveRecord::Migration
  def change
    drop_table :persons_projects
  end
end
