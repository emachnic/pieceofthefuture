class ContactMailerController < ActionController::Base
  layout 'application'
  def index
    @contact_mailer = ContactMailer.new(params[:contact_mailer])
  end
  
  def send_email
    @contact_mailer = ContactMailer.new(params[:contact_mailer])
    @contact_mailer.request = request
    if @contact_mailer.valid? && !@contact_mailer.spam?
      @contact_mailer.deliver
      DonationMailer.support_email(@contact_mailer).deliver
      flash[:notice] = "Thank you for your email. Someone will follow up with you shortly."
      redirect_to root_path
    else
      render :index
    end
  end
end