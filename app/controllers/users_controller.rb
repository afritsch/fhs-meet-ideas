class UsersController < ApplicationController
  add_breadcrumb I18n.t("users.index.title"), "/users"

  def index
    @users = User.paginate(:page => params[:page], :per_page => 50).order("fullname")
    # @users = User.find_by_sql(["
#       SELECT COUNT(DISTINCT roles.project_id) AS count, users.*
#       FROM roles
#       INNER JOIN users
#       ON roles.name = users.fullname
#       GROUP BY roles.name
#       ORDER BY roles.name
#     "])
  end

  def show
    @user = User.find(params[:id])
    @projects = @user.projects

    add_breadcrumb @user.fullname, @user
  end
end
