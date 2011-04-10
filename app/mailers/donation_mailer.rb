class DonationMailer < ActionMailer::Base
  default :from => "no-reply@pieceofthefuture.org"

  def donation_email(contact_form)
    @name = contact_form.name
    @confirmation = contact_form.confirmation
    @donation = contact_form.donation_id
    mail :to => contact_form.email, :subject => "New Donation"
  end
  
  def support_email(contact_mailer)
    @name = contact_mailer.name
    @support_type = contact_mailer.support_type
    mail :to => contact_mailer.email, :subject => "New #{@support_type} Request"
  end
end