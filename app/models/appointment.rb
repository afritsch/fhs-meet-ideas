class Appointment < ActiveRecord::Base
  attr_accessible :appointment, :description, :project_id
end
