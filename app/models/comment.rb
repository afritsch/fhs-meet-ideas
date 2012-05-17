class Comment < ActiveRecord::Base
  attr_accessible :content, :date, :user_id, :project_id
  
  belongs_to :projects
  belongs_to :users
end
