class UsersController < ApplicationController
  add_breadcrumb I18n.t("users.index.title"), "/users"

  def index
    # get all users involved in projects
    sql = "
      SELECT COUNT(DISTINCT roles.project_id) AS count, users.*
      FROM roles
      INNER JOIN users
      ON roles.name = users.fullname
      GROUP BY roles.name
      ORDER BY roles.name
    "

    # get all users NOT involved in projects
    sql2 = "
      SELECT DISTINCT fullname, users.*
      FROM users
      INNER JOIN roles
      WHERE users.fullname NOT IN (
        SELECT name
        FROM roles
      )
      ORDER BY fullname
    "

    @users_with_projects = User.paginate_by_sql(sql, :page => params[:withProjects], :per_page => 20)
    @users_without_projects = User.paginate_by_sql(sql2, :page => params[:withoutProjects], :per_page => 20)
  end

  def show
    @user = User.find(params[:id])

    # get all projects where user is involved
    @projects = Project.find_by_sql(["
      SELECT DISTINCT projects.id, projects.title
      FROM projects
      INNER JOIN roles
      ON roles.project_id = projects.id
      WHERE roles.user_id = ?",
      params[:id]
    ])

    add_breadcrumb @user.fullname, @user
  end
end
