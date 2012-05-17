class User < ActiveRecord::Base
  attr_accessible :email, :fhsid, :firstname, :lastname
end
