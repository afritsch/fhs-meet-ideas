class UserSessionsController < ApplicationController
  skip_before_filter :require_login, :only => [:new, :create]
  
  def new
    unless logged_in?
      @user_session = UserSession.new
    else
      flash[:error] = t("auth.already_logged_in")
      redirect_to root_url
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      session[:id] = @user_session.user_id
      flash[:notice] = t("auth.login_success")
      redirect_to root_url
    else
      flash[:error] = t("auth.login_failure")
      redirect_to login_path
    end
  end

  def destroy
    session[:id] = nil
    flash[:notice] = t("auth.logout")
    redirect_to root_url
  end
end
