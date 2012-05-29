class Role < ActiveRecord::Base
  attr_accessible :title, :name
  
  belongs_to :project
  belongs_to :user
  
  scope :uniquely_named, group(:title)
  
  validates_length_of :title, :within => 3..255, :too_short => I18n.t("validations.length.short", :attr => I18n.t("validations.attr.role_title"), :count => "%{count}"), :too_long => I18n.t("validations.length.long", :attr => I18n.t("validations.attr.role_title"), :count => "%{count}")
  validates_length_of :name, :within => 3..255, :too_short => I18n.t("validations.length.short", :attr => I18n.t("validations.attr.role_name"), :count => "%{count}"), :too_long => I18n.t("validations.length.long", :attr => I18n.t("validations.attr.role_name"), :count => "%{count}")
end
