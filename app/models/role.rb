class Role < ActiveRecord::Base
  attr_accessible :title
  
  has_and_belongs_to_many :persons, :join_table => 'persons_projects_roles'
  has_and_belongs_to_many :projects, :join_table => 'persons_projects_roles'
end
