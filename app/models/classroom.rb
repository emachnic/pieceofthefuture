# == Schema Information
# Schema version: 20110410041454
#
# Table name: classrooms
#
#  id             :integer         not null, primary key
#  class_name     :string(255)
#  teacher        :string(255)
#  phone          :string(255)
#  email          :string(255)
#  wish_list      :text
#  institution_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#

class Classroom < ActiveRecord::Base
  belongs_to :institution
  
  validates :class_name, :presence => true, :uniqueness => true
  validates :teacher, :phone, :email, :presence => true
  
  attr_accessible :class_name, :teacher, :phone, :email, :wish_list, :institution_id
  
  def teacher_with_class
    "#{teacher} - #{class_name}"
  end
end
