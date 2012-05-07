class Person < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :phone
  has_and_belongs_to_many :projects
  has_and_belongs_to_many :roles
end
