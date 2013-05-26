class Post < ActiveRecord::Base
  attr_accessible :name, :user_id, :division_id, :parent_id, :post_type_id
  
  belongs_to :user
  belongs_to :division
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "Post"
  belongs_to :post_type
  
  validates :name, :user_id, :division_id, :presence => true, 
  validates :name, :length => { :maximum => 255 }
end
