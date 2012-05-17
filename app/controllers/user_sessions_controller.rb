class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      session[:id] = @user_session.user_id
      flash[:notice] = t(:flash_login_success)
      redirect_to root_url
    else
      flash[:error] = t(:flash_login_failure)
      redirect_to login_path
    end
  end

  def destroy
    session[:id] = nil
    flash[:notice] = t(:flash_logout)
    redirect_to root_url
  end
end
