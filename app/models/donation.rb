# == Schema Information
# Schema version: 20110412011056
#
# Table name: donations
#
#  id                       :integer         not null, primary key
#  success                  :boolean
#  authorization            :string(255)
#  message                  :string(255)
#  params                   :text
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
#

class Donation < ActiveRecord::Base
  belongs_to :institution
  belongs_to :classroom
  serialize :params
  
  def response=(response)
    self.success        = response.success?
    self.authorization  = response.authorization
    self.message        = response.message
    self.params         = response.params
  rescue ActiveMerchant::ActiveMerchantError => e
    self.success       = false
    self.authorization = nil
    self.message       = e.message
    self.params        = {}
    self.first_name    = nil
    self.last_name     = nil
    self.box_quantity  = nil
  end
end
