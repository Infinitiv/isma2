class Article < ActiveRecord::Base
  belongs_to :user
  belongs_to :division
  belongs_to :group
  belongs_to :article_type
  has_many :comments, :dependent => :destroy
  has_many :attachments, :dependent => :destroy
  
  validates :user_id, :article_type_id, :presence => true
  validates :title, :length => { :maximum => 255 }

end
