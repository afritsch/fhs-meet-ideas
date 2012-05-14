# coding: UTF-8

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
    @roles = Project.find_by_sql(['
      SELECT roles.title, people.firstname, people.lastname
      FROM roles
      INNER JOIN persons_projects_roles
        ON persons_projects_roles.role_id = roles.id
      INNER JOIN people
        ON persons_projects_roles.person_id = people.id
      WHERE persons_projects_roles.project_id = ?',
      params[:id]
    ])
    @pictures = Project.find(params[:id]).pictures
    @appointments = Project.find(params[:id]).appointments
    @comments = Project.find_by_sql(['
      SELECT comments.created_at, comments.content, people.firstname, people.lastname
      FROM comments
      INNER JOIN people
        ON people.id = comments.person_id
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
      redirect_to @project, :notice => 'Projekt wurde erfolgreich hinzugefügt!'
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
    redirect_to projects_path, :notice => 'Projekt wurde erfolgreich gelöscht!'
  end
end
