class Project < ActiveRecord::Base
  attr_accessible :description, :status, :title
  has_and_belongs_to_many :persons
  has_and_belongs_to_many :roles
end
