module ApplicationHelper
  def current_user
    User.find_by_id(session[:id])
  end

  def ssl_protocol
    Rails.env.production? ? "https"  : "http"
  end

  # thanks to railscasts 244
  def avatar_url(user)
    default_url = "#{root_url}images/default_avatar.png"
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=32&d=#{CGI.escape(default_url)}"
  end

  # thanks to railscasts 197
  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s, :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def link_to_remove_fields name, f
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
  end

  private

  # reimplemented link_to_function because it's deprecated since rails 3.2.5.
  # see http://api.rubyonrails.org/classes/ActionView/Helpers/JavaScriptHelper.html#method-i-link_to_function
  def link_to_function(name, function, html_options={})
    onclick = "#{"#{html_options[:onclick]}; " if html_options[:onclick]}#{function}; return false;"
    href = html_options[:href] || '#'

    content_tag(:a, name, html_options.merge(:href => href, :onclick => onclick))
  end
end
