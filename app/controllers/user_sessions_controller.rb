class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      session[:id] = @user_session.user_id
      redirect_to root_path
    else
      respond_with(@user_session)
    end
  end

  def destroy
  end

  def show
  end
end
