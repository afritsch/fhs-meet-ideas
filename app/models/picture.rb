class Picture < ActiveRecord::Base
  attr_accessible :image, :project_id, :title
  
  belongs_to :projects
  
  mount_uploader :image, PictureUploader
end
