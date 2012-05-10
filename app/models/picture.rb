class Picture < ActiveRecord::Base
  attr_accessible :path, :project_id
  
  belongs_to :projects
end
