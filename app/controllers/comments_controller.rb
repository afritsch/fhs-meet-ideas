class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(params[:comment])
    @comment.user_id = params[:comment][:user_id]
    
    if @comment.save
      flash[:notice] = t("projects.comment.saved")
      redirect_to project_path(@project) + "#comment-" + @comment.id.to_s
    else
      flash[:error] = t("projects.comment.failed")
      redirect_to project_path(@project) + "#comment-" + @comment.id.to_s # todo: show the validation
    end
  end
end
