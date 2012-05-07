# coding: UTF-8

class ProjectsController < ApplicationController
  def index
    @projects = Project.all
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
end
