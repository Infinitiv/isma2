class Attachment < ActiveRecord::Base
  belongs_to :article
  
  validates :article_id, :name, :mime_type, :data, :thumbnail, :presence => true
end
