class FollowupsController < ApplicationController
  # thanks to railscasts 163
  def create
    @followup = current_user.followups.build(:project_id => params[:project_id])
    project = Project.find(params[:project_id])

    if @followup.save
      flash[:notice] = t("followups.following", :project => project.title)
      redirect_to_back
    else
      flash[:error] = t("followups.fault", :project => project.title)
      redirect_to_back
    end
  end

  def destroy
    @followup = current_user.followups.find(params[:id])
    project = Project.find(Followup.find(params[:id]).project_id)

    @followup.destroy
    flash[:notice] = t("followups.unfollowing", :project => project.title)
    redirect_to_back
  end

  private

  def redirect_to_back(default = projects_path)
    if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
  end
end
