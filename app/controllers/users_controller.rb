class UsersController < ApplicationController
  add_breadcrumb I18n.t("users.index.title"), "/users"

  def index
    # thanks to railscast 251 (meta_search)
    # get all users involved in projects
    @search_with_projects = User.joins(:roles)
      .group("roles.name")
      .select("COUNT(DISTINCT roles.project_id) AS count, users.*")
      .search(params[:search])
    @users_with_projects =  @search_with_projects.paginate(:page => params[:with_projects], :per_page => 20)

    # get all users NOT involved in projects
    @search_without_projects = User.includes(:roles)
      .select("DISTINCT fullname, users.*")
      .where("users.fullname NOT IN (SELECT name FROM roles)")
      .search(params[:search])
    @users_without_projects =  @search_without_projects.paginate(:page => params[:without_projects], :per_page => 20)
  end

  def show
    @user = User.find(params[:id])

    # get all projects where user is involved
    @projects = Project.find(
      :all,
      :joins => :roles,
      :select => "DISTINCT projects.id, projects.title",
      :conditions => ["roles.user_id = ?", params[:id]]
    )

    add_breadcrumb @user.fullname, @user
  end
end
