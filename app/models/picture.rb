class Picture < ActiveRecord::Base
  attr_accessible :image, :project_id, :remote_image_url, :title
  
  belongs_to :projects
  
  mount_uploader :image, PictureUploader
end
