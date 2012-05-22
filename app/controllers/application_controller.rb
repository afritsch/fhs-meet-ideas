class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :require_login
  
  # thanks to ruby-forum.com/topic/187836
  def update_date(*args)
    rec = args.shift
    args.each do |e|
      d,m,y,time = params[rec][e].split(/\.| /)
      params[rec][e] = y + '-' + m + '-' + d + ' ' + time unless y.nil?
    end
  end
  
  protected
  
  # thanks to
  # http://szeryf.wordpress.com/2008/06/13/easy-and-flexible-breadcrumbs-for-rails/
  def add_breadcrumb name, url = ''
    @breadcrumbs ||= []
    url = eval(url) if url =~ /_path|_url|@/
    @breadcrumbs << [name, url]
  end
 
  def self.add_breadcrumb name, url, options = {}
    before_filter options do |controller|
      controller.send(:add_breadcrumb, name, url)
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
