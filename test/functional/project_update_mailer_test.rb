require 'test_helper'

class ProjectUpdateMailerTest < ActionMailer::TestCase
  def test_welcome_email
    user = users(:one)
    project = projects(:one)

    email = ProjectUpdateMailer.project_update(user, project).deliver
    assert !ActionMailer::Base.deliveries.empty?

    assert_equal [user.email], email.to
    assert_equal I18n.t("followups.mailer.subject", :project => project.title), email.subject
    assert_match(I18n.t("followups.mailer.body.welcome", :name => user.fullname), email.encoded)
    assert_match(I18n.t("followups.mailer.body.salutation"), email.encoded)
  end
end
