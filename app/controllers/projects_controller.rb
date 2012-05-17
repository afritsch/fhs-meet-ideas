class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
    @roles = Project.find_by_sql(['
      SELECT roles.title, users.firstname, users.lastname
      FROM roles
      INNER JOIN projects_roles_users
        ON projects_roles_users.role_id = roles.id
      INNER JOIN users
        ON users.id = projects_roles_users.user_id
      WHERE projects_roles_users.project_id = ?',
      params[:id]
    ])
    @pictures = Project.find(params[:id]).pictures
    @appointments = Project.find(params[:id]).appointments
    @comments = Project.find_by_sql(['
      SELECT comments.created_at, comments.content, users.firstname, users.lastname
      FROM comments
      INNER JOIN users
        ON users.id = comments.user_id
      WHERE comments.project_id = ?',
      params[:id]
    ])
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])

    if @project.save
      flash[:notice] = t('projects.new.saved')
      redirect_to @project
    else
      render action: 'new'
    end
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    @project.update_attributes(params[:project])
    
    redirect_to project_path
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = t('projects.show.destroyed')
    redirect_to projects_path
  end
end
