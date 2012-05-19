class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_login
  
  def update_date(*args)
    rec = args.shift
    args.each do |e|
      d,m,y,time = params[rec][e].split(/\.| /)
      params[rec][e] = y + '-' + m + '-' + d + ' ' + time unless y.nil?
    end
  end
 
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
