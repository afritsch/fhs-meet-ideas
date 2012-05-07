class Comment < ActiveRecord::Base
  attr_accessible :content, :date, :person_id, :project_id
end
