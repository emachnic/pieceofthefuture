class DonateController < ApplicationController
  def send_email
    @contact_form = ContactForm.new(params[:contact_form])
    @contact_form.request = request
    if @contact_form.valid? && !@contact_form.spam?
      @contact_form.deliver
      flash[:notice] = "Email sent successfully, We will notify you if further action must be taken"
      redirect_to :controller => 'donations', :action => 'receipt', :id => params[:contact_form][:donation_id]
    else
      render :step_two
    end
  end

end
