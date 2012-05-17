class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      session[:id] = @user_session.user_id
      redirect_to projects_path, :notice => "Angemeldet!"
    else
      redirect_to root_path, :notice => "Fehler!"
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_url
  end
end
