class UsersController < ApplicationController
  add_breadcrumb I18n.t("users.index.title"), "/users"

  def index
    # get all users involved in projects
    @users_with_projects = User.paginate(
      :joins => :roles,
      :select => "COUNT(DISTINCT roles.project_id) AS count, users.*",
      :group => "roles.name",
      :order => "roles.name",
      :page => params[:with_projects],
      :per_page => 20
    )

    # get all users NOT involved in projects
    @users_without_projects = User.paginate(
      :include => :roles,
      :select => "DISTINCT fullname, users.*",
      :conditions => ["users.fullname NOT IN (SELECT name FROM roles)"],
      :order => "fullname",
      :page => params[:without_projects],
      :per_page => 20
    )
  end

  def show
    @user = User.find(params[:id])

    # get all projects where user is involved
    @projects = Project.find(:all, :joins => :roles, :select => "DISTINCT projects.id, projects.title", :conditions => ["roles.user_id = ?", params[:id]])

    add_breadcrumb @user.fullname, @user
  end
end
