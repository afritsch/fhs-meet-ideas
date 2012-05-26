class ProjectsController < ApplicationController
  add_breadcrumb I18n.t("projects.index.title"), "/projects"
  
  autocomplete :role, :title, :full => true, :scopes => [:uniquely_named]
  autocomplete :project, :status, :full => true, :scopes => [:uniquely_named]
  autocomplete :user, :fullname, :full => true
  
  def index
    @projects = Project.order("id DESC")
  end
  
  def show
    @project = Project.find(params[:id], :select => "projects.*, users.email, users.fullname", :joins => :user)
    @roles = @project.roles.select("name, title")
    @pictures = @project.pictures.select("image, title")
    @appointments = @project.appointments.select("date, description")
    @comments = @project.comments.find(:all, :select => "comments.content, comments.created_at, comments.id, users.email, users.fullname", :joins => :user)
        
    add_breadcrumb @project.title, @project
  end
  
  def new
    @project = Project.new
    @project.appointments.build
    @project.pictures.build
    @project.roles.build
    
    add_breadcrumb t("projects.new.title"), new_project_path
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
    
    add_breadcrumb @project.title, @project
    add_breadcrumb t("common.edit"), edit_project_path(@project)
    
    unless @project.user_id === current_user.id
      flash[:error] = t("projects.edit.denied")
      redirect_to @project
    end
  end
  
  def update
    @project = Project.find(params[:id])
    
    update_date(:date)
    @project.updated_at = Time.now
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
