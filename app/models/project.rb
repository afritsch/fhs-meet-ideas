class Project < ActiveRecord::Base
  attr_accessible :description, :status, :title
end
