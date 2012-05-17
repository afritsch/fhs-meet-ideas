class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_login
 
  private
 
  def require_login
    unless logged_in?
      flash[:error] = t('auth.login_required')
      redirect_to login_path
    end
  end
  
  def logged_in?
    !!current_user
  end
  
  def current_user
    User.find_by_id(session[:id])
  end
end
