class HomeController < ApplicationController
  skip_before_filter :require_login, :only => [:index]
  
  def index
    render current_user ? "user" : "guest"
  end
end
