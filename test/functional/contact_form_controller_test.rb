require 'test_helper'

class ContactFormControllerTest < ActionController::TestCase
  test "should create contact message" do
    post :create, :contact_form => { :name => "Name", :email => "email@domain.tld", :subject => "Subject", :message => "Message" }
    assert_not_nil assigns(:contact_form)
    assert_equal I18n.t("contact_form.new.sent"), flash[:notice]
    assert_redirected_to root_path
  end
end
