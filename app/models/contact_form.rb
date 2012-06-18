class ContactForm
  # thanks to http://matharvard.ca/posts/2011/aug/22/contact-form-in-rails-3/
  include ActiveModel::Validations
  include ActiveModel::Conversion

  extend ActiveModel::Naming

  attr_accessor :email, :message, :name, :subject

  validates :email, :format => { :with => %r{([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})}, :message => I18n.t("contact_form.validations.email") }
  validates :message, :presence => { :message => I18n.t("contact_form.validations.message", :attr => I18n.t("contact_form.validations.attr.message")) }
  validates :name, :presence => { :message => I18n.t("contact_form.validations.message", :attr => I18n.t("contact_form.validations.attr.name")) }
  validates :subject, :presence => { :message => I18n.t("contact_form.validations.message", :attr => I18n.t("contact_form.validations.attr.subject")) }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end