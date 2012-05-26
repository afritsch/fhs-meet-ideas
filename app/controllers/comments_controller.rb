class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(params[:comment])
    @comment.user_id = params[:comment][:user_id]
    @comment.save
    
    redirect_to project_path(@project) + "#comment-" + @comment.id.to_s
  end
end
