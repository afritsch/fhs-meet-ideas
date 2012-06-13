class FollowupsController < ApplicationController
  # thanks to railscasts 163
  def create
    @followup = current_user.followups.build(:project_id => params[:project_id])

    if @followup.save
      flash[:notice] = "Du folgst dem Projekt!"
      redirect_to :back
    else
      flash[:error] = "Folgen fehlgeschlagen!"
      redirect_to :back
    end
  end

  def destroy
    @followup = current_user.followups.find(params[:id])
    @followup.destroy
    flash[:notice] = "Du folgst dem Projekt nicht mehr!"
    redirect_to :back
  end
end
