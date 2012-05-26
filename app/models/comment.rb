class Comment < ActiveRecord::Base
  attr_accessible :content, :date, :user_id, :project_id
  
  belongs_to :project
  belongs_to :user
  
  validates_length_of :content, :within => 3..255, :too_short => I18n.t("validations.length.short", :attr => I18n.t("validations.attr.comment"), :count => "%{count}"), :too_long => I18n.t("validations.length.long", :attr => I18n.t("validations.attr.comment"), :count => "%{count}")
end
