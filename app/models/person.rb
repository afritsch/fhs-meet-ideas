class Person < ActiveRecord::Base
  attr_accessible :email, :firstname, :lastname, :phone
end
