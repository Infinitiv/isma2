class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :article
  
  validates :user_id, :article_id, :content, :presence => true
  validates :content, :length => { :maximum => 50 }
end
