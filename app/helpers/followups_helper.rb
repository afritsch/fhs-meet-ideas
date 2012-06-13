module FollowupsHelper
  def canUnfollow?
    user_path(current_user.id) === request.fullpath
  end

  def following?(project_id)
    Followup.find_by_project_id_and_user_id(project_id, current_user.id)
  end
end
