class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_locale
  before_filter :require_login

  protected

  # thanks to http://szeryf.wordpress.com/2008/06/13/easy-and-flexible-breadcrumbs-for-rails/
  def add_breadcrumb name, url = ''
    @breadcrumbs ||= []
    @breadcrumbs << [name, url]
  end

  def self.add_breadcrumb name, url, options = {}
    before_filter options do |controller|
      controller.send(:add_breadcrumb, name, url)
    end
  end
  
  # handle redirect to last visited page with disabled referer
  def redirect_back_path(default = projects_path)
    (!request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]) ? :back : default
  end

  private

  # localization support
  def set_locale
    I18n.locale = extract_locale_from_accept_language_header
  end

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first unless request.env['HTTP_ACCEPT_LANGUAGE'] === nil
  end

  # authentication methods
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
