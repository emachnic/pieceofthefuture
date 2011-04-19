# == Schema Information
# Schema version: 20110413150550
#
# Table name: donations
#
#  id                       :integer         not null, primary key
#  first_name               :string(255)
#  last_name                :string(255)
#  ad_website               :string(255)
#  email                    :string(255)
#  box_quantity             :integer
#  custom_institution_name  :string(255)
#  custom_classroom_name    :string(255)
#  custom_classroom_teacher :string(255)
#  custom_classroom_school  :string(255)
#  institution_id           :integer
#  classroom_id             :integer
#  created_at               :datetime
#  updated_at               :datetime
#  card_type                :string(255)
#  card_expires_on          :date
#  ip_address               :string(255)
#

class Donation < ActiveRecord::Base
  belongs_to :institution
  belongs_to :classroom
  has_many  :transactions, :class_name => 'DonationTransaction'
  
  validates :first_name, :last_name, :presence => true
  validates :email, :presence => true, :confirmation => true
  validates :box_quantity, :format => {:with => /^(1|\d*[24680])$/, :message => "must be '1' or even number."}
  
  attr_accessor :card_number, :card_verification, :address1, :address2, :city,
    :state, :zip, :phone
  
  validate_on_create :validate_card
  
  def purchase
    response = paypal_gateway.create_profile(nil, :credit_card => credit_card,
      :description => 'Piece of the Future Box', :start_date => Date.today,
      :period => 'Year', :frequency => 1, :amount => price_in_cents, 
      :initial_amount => price_in_cents, :auto_bill_outstanding => true)
    transactions.create!(:action => 'purchase', :amount => price_in_cents, :response => response)
    response.success?
  end
  
  def price_in_cents
    (box_quantity * 500).round
  end
  
  private
  
  def paypal_gateway
    ActiveMerchant::Billing::PaypalRecurringGateway.new(YAML.load_file(File.join(RAILS_ROOT, 'config', 'paypal.yml'))[RAILS_ENV].symbolize_keys)
  end
  
  def paypal_error(response)
    @paypal_error = response.message
    render :action => 'index'
  end
    
  def validate_card
    unless credit_card.valid?
      credit_card.errors.full_messages.each do |message|
        errors.add_to_base message
      end
    end
  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :first_name => first_name,
      :last_name => last_name,
      :month => card_expires_on.month,
      :year => card_expires_on.year,
      :type => card_type,
      :number => card_number,
      :verification_value => card_verification
      )
  end
end
