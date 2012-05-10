class Person < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :phone
  
  has_and_belongs_to_many :projects, :join_table => 'persons_projects_roles'
  has_and_belongs_to_many :roles, :join_table => 'persons_projects_roles'
  has_many :comments
end
