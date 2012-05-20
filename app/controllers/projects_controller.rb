class ProjectsController < ApplicationController
  def index
    @projects = Project.order("id DESC")
  end
  
  def show
    @project = Project.find_by_sql(["
      SELECT projects.*, users.firstname, users.lastname, users.email
      FROM projects
      INNER JOIN users
        ON users.id = projects.user_id
      WHERE projects.id = ?",
      params[:id]
    ]).first()
    
    @roles = Project.find_by_sql(["
      SELECT roles.title, users.firstname, users.lastname
      FROM roles
      INNER JOIN projects_roles_users
        ON projects_roles_users.role_id = roles.id
      INNER JOIN users
        ON users.id = projects_roles_users.user_id
      WHERE projects_roles_users.project_id = ?",
      params[:id]
    ])
    @pictures = Project.find(params[:id]).pictures
    @appointments = Project.find(params[:id]).appointments
    @comments = Project.find_by_sql(["
      SELECT comments.created_at, comments.content, users.firstname, users.lastname
      FROM comments
      INNER JOIN users
        ON users.id = comments.user_id
      WHERE comments.project_id = ?",
      params[:id]
    ])
  end
  
  def new
    @project = Project.new
    @project.appointments.build
    @project.pictures.build
  end
  
  def create
    @project = Project.new(params[:project])
    @project.user_id = current_user.id
    update_date(:date)

    if @project.save
      flash[:notice] = t("projects.new.saved")
      redirect_to @project
    else
      render "new"
    end
  end
  
  def edit
    @project = Project.find(params[:id])
    
    unless @project.user_id === current_user.id
      flash[:error] = t("projects.edit.denied")
      redirect_to @project
    end
  end
  
  def update
    @project = Project.find(params[:id])
    
    update_date(:date)
    @project.update_attributes(params[:project])
    
    flash[:notice] = t("projects.edit.updated")
    redirect_to @project
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    
    flash[:notice] = t("projects.show.destroyed")
    redirect_to projects_path
  end
end
