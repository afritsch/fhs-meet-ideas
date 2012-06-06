class User < ActiveRecord::Base
  attr_accessible :email, :fhsid, :fullname, :phone

  has_many :comments
  has_many :projects
  has_many :roles
end
