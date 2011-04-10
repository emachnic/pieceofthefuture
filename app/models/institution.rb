# == Schema Information
# Schema version: 20110410031628
#
# Table name: institutions
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  school_site   :string(255)
#  contact_name  :string(255)
#  contact_email :string(255)
#  contact_title :string(255)
#  street_one    :string(255)
#  street_two    :string(255)
#  city          :string(255)
#  state         :string(255)
#  postal_code   :string(255)
#  phone         :string(255)
#  wish_list     :text
#  created_at    :datetime
#  updated_at    :datetime
#

class Institution < ActiveRecord::Base
  has_many :classrooms
  has_many :donations
  
  validates :name, :presence => true, :uniqueness => true
  validates :contact_name, :presence => true
  validates :contact_email, :presence => true, :confirmation => true
  validates :street_one, :city, :state, :postal_code, :phone, :presence => true

  attr_accessible :name, :school_site, :contact_name, :contact_email, :contact_title,
    :street_one, :street_two, :city, :state, :postal_code, :phone, :wish_list
    
  def self.search(search)  
    if search  
      where('name LIKE ?', "#{search}")  
    else  
      scope
    end  
  end
end
