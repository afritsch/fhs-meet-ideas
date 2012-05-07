# coding: UTF-8

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
    
  end
  
  def new
    @project = Project.new
  end
  
  def create
    @project = Project.new(params[:project])

    if @project.save
      redirect_to @project, notice: 'Projekt wurde erfolgreich hinzugefügt!'
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
