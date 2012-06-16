class User < ActiveRecord::Base
  attr_accessible :email, :fhsid, :fullname, :phone

  has_many :comments
  has_many :projects
  has_many :roles

  has_many :followups
  has_many :projects, :through => :followups

  def display_name
    "#{self.fullname}".camelize
  end
end
