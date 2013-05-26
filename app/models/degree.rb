class Degree < ActiveRecord::Base
  attr_accessible :name, :short_name
  
  has_many :profiles
  has_many :users, :through => :profiles
  
  validates :name, :presence => true, 
            :length => { :maximum => 50 }, 
            :uniqueness => true
  validates :short_name, :presence => true, 
            :length => { :maximum => 15 }, 
            :uniqueness => true
end
