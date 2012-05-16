Rails.application.config.middleware.use OmniAuth::Strategies::LDAP,
      :host => 'denise.core.fh-salzburg.ac.at',
      :port => 636,
      :method => :ssl,
      :base => 'ou=People,ou=Urstein,o=fh-salzburg.ac.at,o=FHS',
      :uid => 'username',
      :password => '#{password}'
