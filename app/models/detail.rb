class Detail < ActiveRecord::Base
  attr_accessible :key, :value
  
  validates :key, :presence => true,
	    :uniqueness => true
end
