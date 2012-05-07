class Role < ActiveRecord::Base
  attr_accessible :title
  has_and_belongs_to_many :persons
  has_and_belongs_to_many :projects
end
