module ProjectsHelper
  def allowed?
    return @project.user_id === current_user.id
  end
end
