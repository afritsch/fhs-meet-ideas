class Appointment < ActiveRecord::Base
  attr_accessible :date, :description, :project_id
  
  belongs_to :projects
  
  validates_length_of :description, :within => 3..255, :too_short => I18n.t("validations.length.short", :attr => I18n.t("validations.attr.appointment_description"), :count => "%{count}"), :too_long => I18n.t("validations.length.long", :attr => I18n.t("validations.attr.appointment_description"), :count => "%{count}")
end
