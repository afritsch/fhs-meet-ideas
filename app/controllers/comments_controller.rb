class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      @project.followups.each do |follower|
        ProjectUpdateMailer.delay.project_update(User.find(follower.user_id), @project)
      end

      flash[:notice] = t("projects.comment.saved")
      redirect_to project_path(@project) + "#" + dom_id(@comment)
    else
      flash[:error] = t("projects.comment.failed")
      redirect_to project_path(@project)
    end
  end
end
