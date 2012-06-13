class FollowupsController < ApplicationController
  # thanks to railscasts 163
  def create
    @followup = current_user.followups.build(:project_id => params[:project_id])
    project = Project.find(params[:project_id])

    if @followup.save
      flash[:notice] = t("followups.following", :project => project.title)
      redirect_to :back
    else
      flash[:error] = t("followups.fault", :project => project.title)
      redirect_to :back
    end
  end

  def destroy
    @followup = current_user.followups.find(params[:id])
    project = Project.find(Followup.find(params[:id]).project_id)

    @followup.destroy
    flash[:notice] = t("followups.unfollowing", :project => project.title)
    redirect_to :back
  end
end
