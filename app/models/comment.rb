class Comment < ActiveRecord::Base
  attr_accessible :content, :date, :person_id, :project_id
  
  belongs_to :projects
  belongs_to :persons
end
