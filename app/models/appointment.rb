class Appointment < ActiveRecord::Base
  attr_accessible :appointment, :description, :project_id
  
  belongs_to :projects
end
