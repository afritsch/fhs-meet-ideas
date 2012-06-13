class ProjectsController < ApplicationController
  add_breadcrumb I18n.t("projects.index.title"), "/projects"

  autocomplete :role, :title, :full => true, :scopes => [:uniquely_named]
  autocomplete :project, :status, :full => true, :scopes => [:uniquely_named]
  autocomplete :user, :fullname, :full => true

  def index
    @projects = Project.paginate(:page => params[:page], :per_page => 10).order("id DESC")
  end

  def show
    @project = Project.find(params[:id], :joins => :user, :select => "projects.*, users.email, users.fullname")
    @roles = @project.roles.select("name, title, user_id")
    @pictures = @project.pictures.select("image, title")
    @appointments = @project.appointments.select("date, description").order("date")
    @comments = @project.comments.joins(:user).select("comments.content, comments.created_at, comments.id, comments.user_id, users.email, users.fullname").order("comments.id")

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

    add_breadcrumb @project.title, @project
    add_breadcrumb t("common.edit"), edit_project_path(@project)
  end

  def update
    @project = Project.find(params[:id])

    @project.updated_at = Time.now

    if @project.update_attributes(params[:project])
      flash[:notice] = t("projects.edit.updated")
      redirect_to @project
    else
      render "edit"
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    flash[:notice] = t("projects.show.destroyed")
    redirect_to projects_path
  end
end
