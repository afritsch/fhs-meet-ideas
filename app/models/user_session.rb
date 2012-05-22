class UserSession < ActiveRecord::Base
  attr_accessible :login, :password
  
  def initialize (options = {})
    super
    self.login = options[:login]
    self.password = options[:password]
  end
  
  def save()
    return false unless self.valid?
    
    user = User.find_by_fhsid self.login
    
    if !user || !ldap(self.login, self.password)
      return false
    else
      self.user_id = user.id
      return true
    end
  end 

  private

  def ldap user, password
    require "net/ldap"

    # thanks to mediacube portfolio
    if Rails.env.production?
      ldap = Net::LDAP.new(
        :host=>"denise.core.fh-salzburg.ac.at",
        :port=>636,
        :encryption => :simple_tls
      )

      return ldap.bind_as(:base => "uid=#{user},ou=People,ou=Urstein,o=fh-salzburg.ac.at,o=FHS", :password=>password) ? true : false
    else
      # return true on development
      return true
    end
  end
end
