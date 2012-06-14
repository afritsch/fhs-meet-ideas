ActionMailer::Base.smtp_settings = {
  :address              => "localhost",
  :port                 => 25,
  :domain               => "meet-ideas.mediacube.at"
}

ActionMailer::Base.default_url_options[:host] = "http://meet-ideas.mediacube.at"