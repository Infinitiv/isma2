class PostType < ActiveRecord::Base
  attr_accessible :name
  
  has_many :posts
  has_many :profiles, :through => :posts
  has_many :users, :through => :profiles
    
  validates :name, :presence => true, 
            :length => { :maximum => 50 }, 
            :uniqueness => true
end
