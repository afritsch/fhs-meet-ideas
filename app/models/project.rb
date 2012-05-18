class Project < ActiveRecord::Base
  attr_accessible :description, :status, :title, :pictures_attributes, :appointments_attributes
  
  has_and_belongs_to_many :users, :join_table => 'projects_roles_users'
  has_and_belongs_to_many :roles, :join_table => 'projects_roles_users'
  has_many :pictures, :dependent => :destroy
  has_many :appointments, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  accepts_nested_attributes_for :appointments, :reject_if => lambda { |a| a[:date].blank? || a[:description].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :pictures, :reject_if => lambda { |a| a[:path].blank? }, :allow_destroy => true
end
