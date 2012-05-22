class Picture < ActiveRecord::Base
  attr_accessible :image, :project_id, :title
  
  belongs_to :projects
  
  # carrierwave picture uploader gem
  mount_uploader :image, PictureUploader
end
