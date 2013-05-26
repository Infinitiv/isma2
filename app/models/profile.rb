class Profile < ActiveRecord::Base
  attr_accessible :user_id, :first_name, :middle_name, :last_name, :degree_id, :academic_title_id, :email, :phone, :avatar
  
  belongs_to :user
  belongs_to :degree
  belongs_to :academic_title
  
  validates :first_name, :middle_name, :last_name, :email, :phone, :presence => true, 
            :length => { :maximum => 50 }, 
  validates :email, :phone, :uniqueness => true
  
end
