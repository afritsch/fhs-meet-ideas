class ProjectUpdateMailer < ActionMailer::Base
  default from: "meet-ideas <meet.ideas@gmail.com>"

  def project_update(user, project)
    @user = user
    @project = project
    mail(:to => "#{user.fullname} <#{user.email}>", :subject => t("followups.mailer.subject", :project => @project.title))
  end
end
