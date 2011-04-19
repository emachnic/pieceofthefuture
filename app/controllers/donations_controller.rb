class DonationsController < ApplicationController
  if ::Rails.env == 'production'
    ssl_required :new, :create
    ssl_allowed :send_information, :receipt, :update_classroom_select
  end
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

  def get_classrooms
    @classrooms = Classroom.find_by_institution(:all).order(:class_name)
  end

  def receipt
    @donation = Donation.find(params[:id])
  end

  def send_information
    @donation = Donation.find(params[:id])
    @contact_form = ContactForm.new(params[:contact_form])
  end

  def failure
    @response = DonationTransaction.last.response
  end

  def update_classroom_select
    classrooms = Classroom.where(:institution_id => params[:id]).order(:name) unless (params[:id] == 0)
    render :partial => 'classrooms', :locals => {:classrooms => classrooms}
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
    @classrooms = Classroom.order(:name)
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
      @box = Box.first
      @new_quantity = @box.quantity - @donation.box_quantity
      @box.update_attributes(:quantity => @new_quantity)
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
