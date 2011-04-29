# == Schema Information
# Schema version: 20110410031628
#
# Table name: boxes
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  quantity   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Box < ActiveRecord::Base
  validates :name, :quantity, :presence => true
  validates :quantity, :numericality => {:only_integer => true}, :format => {:with => /^\d*$/}
end
