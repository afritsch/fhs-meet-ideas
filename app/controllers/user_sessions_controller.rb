class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      session[:id] = @user_session.user_id
      redirect_to root_url, :notice => t(:flash_login_success)
    else
      redirect_to login_path, :error => t(:flash_login_failure)
    end
  end

  def destroy
    session[:id] = nil
    redirect_to root_url, :notice => t(:flash_logout)
  end
end
