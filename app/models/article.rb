class Article < ActiveRecord::Base
  attr_accessible :user_id, :title, :content, :exp_date, :published, :fixed, :commentable, :division_id, :group_id, :article_type_id
  
  belongs_to :user
  belongs_to :division
  belongs_to :group
  belongs_to :article_type
  has_many :comments
  has_many :attachments
  
  validates :user_id, :article_type_id, :presence => true
  validates :title, :length => { :maximum => 255 }

end
