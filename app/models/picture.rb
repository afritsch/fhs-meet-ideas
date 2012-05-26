class Picture < ActiveRecord::Base
  attr_accessible :image, :project_id, :title
  
  belongs_to :projects
  
  mount_uploader :image, PictureUploader
  
  validates_length_of :title, :within => 3..255, :too_short => I18n.t("validations.length.short", :attr => I18n.t("validations.attr.picture_title"), :count => "%{count}"), :too_long => I18n.t("validations.length.long", :attr => I18n.t("validations.attr.picture_title"), :count => "%{count}")
end
