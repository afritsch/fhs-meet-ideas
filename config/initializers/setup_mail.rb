ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
 #:domain               => "meet-ideas.mediacube.at",
  :user_name            => "meet.ideas",
  :password             => "sdf87sdf",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "http://meet-ideas.mediacube.at"