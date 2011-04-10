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
