class Project < ActiveRecord::Base
  attr_accessible :description, :status, :title
  has_and_belongs_to_many :persons, :join_table => 'persons_projects_roles'
  has_and_belongs_to_many :roles, :join_table => 'persons_projects_roles'
end
