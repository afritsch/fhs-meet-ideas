class User < ActiveRecord::Base
  attr_accessible :email, :fhsid, :firstname, :lastname, :phone
  
  has_and_belongs_to_many :projects, :join_table => 'projects_roles_users'
  has_and_belongs_to_many :roles, :join_table => 'projects_roles_users'
  has_many :comments
end
