class VersionsController < ApplicationController
  def revert
    @version = Version.find(params[:id])
    @version.reify ? @version.reify.save! : @version.item.destroy

    link = view_context.link_to(I18n.t("paper_trail.undo"), revert_version_path(@version.next, :redo => !params[:redo]), :method => :post)

    flash[:notice] = "#{I18n.t("paper_trail.undid")} #{I18n.t("paper_trail." + @version.event)}. #{link}"
    redirect_to @version.reify ? redirect_back_path : projects_path
  end
end
