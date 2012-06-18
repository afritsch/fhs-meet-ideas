class ContactFormMailer < ActionMailer::Base
  default from: "meet-ideas <meet.ideas@gmail.com>"

  def new_message(message)
    @message = message
    mail(:to => "meet-ideas <meet.ideas@gmail.com>", :reply_to => message.email, :subject => "#{t("contact_form.mailer.subject")} #{message.subject}")
  end
end
