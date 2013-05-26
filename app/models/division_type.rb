class DivisionType < ActiveRecord::Base
  attr_accessible :name
  
  has_many :divisions
  has_many :posts, :through => :divisions
  has_many :profiles, :through => :posts
  has_many :users, :through => :profiles
    
  validates :name, :presence => true, 
            :length => { :maximum => 50 }, 
            :uniqueness => true
end
