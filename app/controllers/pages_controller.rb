class PagesController < ApplicationController
  skip_before_filter :require_login, :only => [:imprint]
  
  add_breadcrumb I18n.t("pages.imprint.title"), "/pages/imprint"
end
