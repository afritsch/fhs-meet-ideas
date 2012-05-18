class PagesController < ApplicationController
  skip_before_filter :require_login, :only => [:imprint]
end
