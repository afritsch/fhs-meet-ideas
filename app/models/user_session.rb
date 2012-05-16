class UserSession < ActiveRecord::Base
  attr_accessible :login, :password, :user_id
  
  def initialize (options = {})
    super
    self.login = options[:login]
    self.password = options[:password]
  end

  def persisted?
    false
  end 
  
  def save()
    return false unless self.valid?
    
    user = User.find_by_fhsid self.login
    if !user
      errors.add(:base, "Benutzername ist falsch")
      return false
    elsif !ldap(self.login, self.password)
      errors.add(:base, "Passwort falsch")
      return false
    else
      self.user_id = user.id
      return true
    end
  end 

  private

  def ldap user, password
    require 'net/ldap'

    # in development modus ist kein Zugriff auf LDAP möglich, deshalb muss hier immer true zurückgegeben werden
    if Rails.env.production?
      ldap = Net::LDAP.new(:host=>"denise.core.fh-salzburg.ac.at",
        :port=>636, :encryption => :simple_tls)

      if ldap.bind_as(:base => "uid=#{user},ou=People,ou=Urstein,o=fh-salzburg.ac.at,o=FHS", :password=>password)
        return true
      else
        return false
      end
    else
      return true # Nur im Development-Modus
    end

  end
end
