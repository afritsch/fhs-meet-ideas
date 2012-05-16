class User < ActiveRecord::Base
  attr_accessible :avatar, :cached_slug, :description, :email, :fhsid, :firstname, :fullname, :is_admin, :isfemale, :profile_visible, :surname, :title, :type
end
