class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :degree
  belongs_to :academic_title
  
  validates :first_name, :middle_name, :last_name, :email, :phone, :presence => true, 
            :length => { :maximum => 50 }, 
  validates :email, :phone, :uniqueness => true
  
end
