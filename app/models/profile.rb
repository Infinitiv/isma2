class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :degree
  belongs_to :academic_title
  
  validates :first_name, :last_name, :presence => true, 
            :length => { :maximum => 50 }
  
end
