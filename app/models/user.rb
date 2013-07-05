class User < ActiveRecord::Base
  has_one :profile, :dependent => :destroy
  has_many :articles
  has_many :comments
  has_many :attachments
  has_many :groups_users
  has_many :groups, :through => :groups_users
  has_many :posts
  has_many :divisions, :through => :posts
  
  validates :login, :presence => true, 
            :length => { :maximum => 50 }, 
            :uniqueness => true
  validates :password, :confirmation => true,
	    :presence => true
  validates :password_confirmation, :presence => true
  has_secure_password
end
