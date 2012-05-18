class Appointment < ActiveRecord::Base
  attr_accessible :date, :description, :project_id
  
  belongs_to :projects
end
