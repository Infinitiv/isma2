class Group < ActiveRecord::Base
  belongs_to :parent, :foreign_key => "parent_id", :class_name => "Group"
  has_many :groups_users
  has_many :users, :through => :groups_users
  has_many :articles, :through => :users
  
  validates :name, :presence => true
end
