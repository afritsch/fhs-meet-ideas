class Project < ActiveRecord::Base
  attr_accessible :description, :status, :title, :appointments_attributes, :pictures_attributes
  
  has_and_belongs_to_many :users, :join_table => 'projects_roles_users'
  has_and_belongs_to_many :roles, :join_table => 'projects_roles_users'
  has_many :pictures, :dependent => :destroy
  has_many :appointments, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  accepts_nested_attributes_for :appointments, :reject_if => lambda { |a| a[:date].blank? || a[:description].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :pictures, :reject_if => lambda { |a| a[:path].blank? }, :allow_destroy => true
  
  validates_length_of :title, :within => 3..255, :too_short => I18n.t("validations.length.short", :attr => I18n.t("validations.attr.title"), :count => "%{count}"), :too_long => I18n.t("validations.length.long", :attr => I18n.t("validations.attr.title"), :count => "%{count}")
  validates_length_of :status, :within => 3..255, :too_short => I18n.t("validations.length.short", :attr => I18n.t("validations.attr.status"), :count => "%{count}"), :too_long => I18n.t("validations.length.long", :attr => I18n.t("validations.attr.status"), :count => "%{count}")
  validates_length_of :description, :within => 10..1000, :too_short => I18n.t("validations.length.short", :attr => I18n.t("validations.attr.description"), :count => "%{count}"), :too_long => I18n.t("validations.length.long", :attr => I18n.t("validations.attr.description"), :count => "%{count}")
end
