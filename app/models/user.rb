class User < ActiveRecord::Base
  attr_accessible :email, :fhsid, :fullname, :phone
  attr_searchable :fullname, :studypath

  has_many :comments
  has_many :projects
  has_many :roles

  has_many :followups
  has_many :projects, :through => :followups
end
