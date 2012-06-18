class ContactFormController < ApplicationController
  skip_before_filter :require_login

  def new
    @contact_form = ContactForm.new

    add_breadcrumb t("contact_form.new.title"), contact_path
  end

  def create
    @contact_form = ContactForm.new(params[:contact_form])

    if @contact_form.valid?
      ContactFormMailer.new_message(@contact_form).deliver

      flash[:notice] = t("contact_form.new.sent")
      redirect_to root_path
    else
      render :new
    end
  end
end
