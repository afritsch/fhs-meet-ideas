class Project < ActiveRecord::Base
  attr_accessible :description, :status, :title
  
  has_and_belongs_to_many :users, :join_table => 'projects_roles_users'
  has_and_belongs_to_many :roles, :join_table => 'projects_roles_users'
  has_many :pictures, :dependent => :destroy
  has_many :appointments, :dependent => :destroy
  has_many :comments, :dependent => :destroy
end
