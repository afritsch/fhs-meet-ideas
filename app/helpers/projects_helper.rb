module ProjectsHelper
  def allowed?
    @project.user_id === current_user.id
  end
end
