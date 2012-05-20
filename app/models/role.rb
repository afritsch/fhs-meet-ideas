class Role < ActiveRecord::Base
  attr_accessible :title, :name
  
  belongs_to :projects
  belongs_to :users
  
  scope :uniquely_named, group(:title)
end
