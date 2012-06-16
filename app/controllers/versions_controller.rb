class VersionsController < ApplicationController
  def revert
    @version = Version.find(params[:id])
    @version.reify ? @version.reify.save! : @version.item.destroy

    link_name = params[:redo] == "true" ? I18n.t("paper_trail.undo") : I18n.t("paper_trail.redo")
    link = view_context.link_to(link_name, revert_version_path(@version.next, :redo => !params[:redo]), :method => :post)
    redirect_to :back, :notice => "#{I18n.t("paper_trail.undid")} #{I18n.t("paper_trail." + @version.event)}. #{link}"
  end
end
