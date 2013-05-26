class Attachment < ActiveRecord::Base
  attr_accessible :article_id, :name, :mime_type, :data, :thumbnail
  
  belongs_to :article
  
  validates :article_id, :name, :mime_type, :data, :thumbnail, :presence => true
end
