# == Schema Information
# Schema version: 20110412011056
#
# Table name: classrooms
#
#  id             :integer         not null, primary key
#  name           :string(255)
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
  
  validates :name, :presence => true, :uniqueness => true
  validates :teacher, :phone, :email, :presence => true
  
  attr_accessible :name, :teacher, :phone, :email, :wish_list, :institution_id
  
  def teacher_with_class
    "#{name} - #{teacher}"
  end
  
  def self.search(search)  
    if search  
      where('name ILIKE ?', "%#{search}%")  
    else  
      scoped  
    end  
  end 
end
