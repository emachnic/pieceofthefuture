class DonationsController < ApplicationController
  
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
  
  def credit
    @states = Decoder::Countries[:US].states.invert
    @creditcard = ActiveMerchant::Billing::CreditCard.new(credit_card)
    render :action => 'payment' and return unless @creditcard.valid?
    
    # Multiply BASE_AMOUNT by number of boxes to get BILL_AMOUNT
    @bill_amount = BASE_AMOUNT * params[:box_quantity].to_i
    
    @response = paypal_gateway.purchase(@bill_amount, @creditcard, purchase_options)
    
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
    @states = Decoder::Countries[:US].states.invert
  end

  # GET /donations/1/edit
  def edit
    @donation = Donation.find(params[:id])
  end

  # POST /donations
  # POST /donations.xml
  def create
    @donation = Donation.new(params[:donation])
    expire_page :controller => :home, :action => :index

    respond_to do |format|
      if @donation.save
        format.html { redirect_to(@donation, :notice => 'Donation was successfully created.') }
        format.xml  { render :xml => @donation, :status => :created, :location => @donation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @donation.errors, :status => :unprocessable_entity }
      end
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
  
    def paypal_gateway(gw = :paypal)
      ActiveMerchant::Billing::Base.gateway(gw).new(YAML.load_file(File.join(RAILS_ROOT, 'config', 'paypal.yml'))[RAILS_ENV].symbolize_keys)
    end
    
    def paypal_error(response)
      @paypal_error = response.message
      render :action => 'index'
    end
    
    def purchase_options
      {
        :ip => request.remote_ip,
        :billing_address => {
          :address1 => params[:address1],
          :address2 => params[:address2],
          :city => params[:city],
          :state => params[:state],
          :country => 'US',
          :zip => params[:zip],
          :phone => params[:phone]
        },
        :box_quantity => params[:box_quantity],
        :first_name => params[:first_name],
        :last_name => params[:last_name],
        :ad_website => params[:ad_website],
        :institution => params[:institution],
        :email => params[:email]
      }
    end
    
    def credit_card
      {
        :first_name => params[:first_name],
        :last_name => params[:last_name],
        :month => params[:month],
        :year => params[:year],
        :type => params[:type],
        :number => params[:number],
        :verification_value => params[:verification_value]
      }
    end
end
