require "test_helper"

class ProjectTest < ActionDispatch::IntegrationTest
  def login
    visit root_path
    click_link I18n.t("layouts.application.login")
    assert current_path == login_path
    fill_in I18n.t("user_sessions.new.fhsid"), :with => users(:one).fhsid
    fill_in I18n.t("user_sessions.new.password"), :with => "knorke"
    click_button I18n.t("common.send")
    assert current_path == root_path
  end

  test "try to show project list as guest" do
    visit root_path
    visit projects_path
    page.has_content? I18n.t("user_sessions.new.title")
  end

  test "login" do
    login
  end

  test "show project list" do
    login
    click_link I18n.t("home.user.projects")
    assert current_path == projects_path
  end

  test "create project" do
    login
    click_link I18n.t("home.user.projects")
    assert current_path == projects_path
    click_link I18n.t("projects.index.new_project")
    assert current_path == new_project_path
    fill_in I18n.t("projects.form.label_title"), :with => projects(:one).title
    fill_in I18n.t("projects.form.label_status"), :with => projects(:one).status
    fill_in I18n.t("projects.form.label_description"), :with => projects(:one).description
    fill_in I18n.t("projects.form.role"), :with => roles(:one).title
    fill_in I18n.t("projects.form.name"), :with => roles(:one).name
    fill_in I18n.t("projects.form.date"), :with => appointments(:one).date
    fill_in I18n.t("projects.form.appointment_description"), :with => appointments(:one).description
    click_button I18n.t("common.send")
    page.has_content? projects(:one).title
  end

  test "show project" do
    login
    click_link I18n.t("home.user.projects")
    assert current_path == projects_path
    click_link projects(:one).title
    page.has_content? projects(:one).title
  end

  test "follow and unfollow project" do
    login
    click_link I18n.t("home.user.projects")
    assert current_path == projects_path
    click_link projects(:two).title
    click_link I18n.t("followups.links.follow")
    click_link I18n.t("followups.links.unfollow")
  end

  test "edit project" do
    login
    click_link I18n.t("home.user.projects")
    assert current_path == projects_path
    click_link projects(:one).title
    page.has_content? projects(:one).title
    click_link I18n.t("common.edit")
    fill_in I18n.t("projects.form.label_title"), :with => projects(:two).title
    fill_in I18n.t("projects.form.label_status"), :with => projects(:two).status
    fill_in I18n.t("projects.form.label_description"), :with => projects(:two).description
    click_button I18n.t("common.send")
    page.has_content? projects(:two).title
  end

  test "create comment" do
    login
    click_link I18n.t("home.user.projects")
    assert current_path == projects_path
    click_link projects(:one).title
    page.has_content? projects(:one).title
    fill_in I18n.t("projects.form.label_comment"), :with => comments(:one).content
    click_button I18n.t("common.send")
    page.has_content? comments(:one).content
  end

  test "destroy project" do
    login
    click_link I18n.t("home.user.projects")
    assert current_path == projects_path
    click_link projects(:one).title
    page.has_content? projects(:one).title
    click_link I18n.t("common.delete")
    assert current_path == projects_path
  end

  test "logout" do
    login
    click_link I18n.t("layouts.application.logout")
    assert current_path == root_path
    visit projects_path
    page.has_content? I18n.t("user_sessions.new.title")
  end
end
