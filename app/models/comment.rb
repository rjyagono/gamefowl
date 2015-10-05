class Comment < ActiveRecord::Base
  belongs_to :fowl
  belongs_to :user
	
	attr_accessible :content, :user_id, :fowl_id
end
