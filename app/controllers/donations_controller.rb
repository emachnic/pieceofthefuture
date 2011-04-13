class DonationsController < ApplicationController
  ssl_required :new, :create
  ssl_allowed :send_information, :receipt
  # Set BASE_AMOUNT to $5.00
  BASE_AMOUNT = 500
  
  # GET /donations
  # GET /donations.xml
  def index
    @donations = Donation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @donations }
    end
  end
  
  def payment
    @creditcard = ActiveMerchant::Billing::CreditCard.new
    @states = Decoder::Countries[:US].states.invert
    @countries = Decoder::Countries
  end
  
  def get_classrooms
    @classrooms = Classroom.find_by_institution(:all).order(:class_name)
  end
  
  def credit    
    @states = Decoder::Countries[:US].states.invert
    @creditcard = ActiveMerchant::Billing::CreditCard.new(credit_card)
    render :action => 'payment' and return unless @creditcard.valid?
    
    # Multiply BASE_AMOUNT by number of boxes to get BILL_AMOUNT
    @bill_amount = BASE_AMOUNT * params[:box_quantity].to_i
    
    @response = paypal_gateway.create_profile(nil, :credit_card => @creditcard,
      :description => 'Piece of the Future Box', :start_date => Date.today,
      :period => 'Year', :frequency => 1, :amount => @bill_amount, 
      :initial_amount => @bill_amount, :auto_bill_outstanding => true)
    
    if @response.success?
      @donation = Donation.create(:response => @response, :first_name => params[:first_name],
        :last_name => params[:last_name], :ad_website => params[:ad_website],
        :institution_id => params[:institution], :classroom_id => params[:classroom],
        :custom_institution_name => params[:custom_institution_name], 
        :custom_classroom_name => params[:custom_classroom_name],
        :custom_classroom_teacher => params[:custom_classroom_teacher],
        :custom_classroom_school => params[:custom_classroom_school],
        :email => params[:email], :box_quantity => params[:box_quantity].to_i)
      @box = Box.first
      @new_quantity = @box.quantity - @donation.box_quantity
      @box.update_attributes(:quantity => @new_quantity)
      flash[:notice] = 'Thank you for buying a Piece of the Future.'
      redirect_to :action => 'send_information', :id => @donation
    else
      paypal_error(@response)
    end
  end
  
  def receipt
    @donation = Donation.find(params[:id])
  end
  
  def send_information
    @donation = Donation.find(params[:id])
    @contact_form = ContactForm.new(params[:contact_form])
  end
  
  def failure
    
  end

  # GET /donations/1
  # GET /donations/1.xml
  def show
    @donation = Donation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @donation }
    end
  end

  # GET /donations/new
  # GET /donations/new.xml
  def new
    @donation = Donation.new(params[:donation])
    @states = Decoder::Countries[:US].states.invert
    @countries = Decoder::Countries
  end

  # GET /donations/1/edit
  def edit
    @donation = Donation.find(params[:id])
  end

  # POST /donations
  # POST /donations.xml
  def create
    @donation = Donation.new(params[:donation])
    @states = Decoder::Countries[:US].states.invert
    @donation.ip_address = request.remote_ip
    expire_page :controller => :home, :action => :index

    if @donation.save
      if @donation.purchase
        redirect_to :action => 'send_information', :id => @donation
      else
        render :action => 'failure'
      end
    else
      render :action => 'new'
    end
  end

  # PUT /donations/1
  # PUT /donations/1.xml
  def update
    @donation = Donation.find(params[:id])

    respond_to do |format|
      if @donation.update_attributes(params[:donation])
        format.html { redirect_to(@donation, :notice => 'Donation was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @donation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /donations/1
  # DELETE /donations/1.xml
  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy

    respond_to do |format|
      format.html { redirect_to(donations_url) }
      format.xml  { head :ok }
    end
  end
  
  protected

end
