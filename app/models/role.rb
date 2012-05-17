class Role < ActiveRecord::Base
  attr_accessible :title
  
  has_and_belongs_to_many :users, :join_table => 'projects_roles_users'
  has_and_belongs_to_many :projects, :join_table => 'projects_roles_users'
end
