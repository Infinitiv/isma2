class ArticleType < ActiveRecord::Base
  attr_accessible :name
  
  has_many :articles
  has_many :users, :through => :articles
  
  validates :name, :presence => true, 
            :length => { :maximum => 50 }, 
            :uniqueness => true
end
