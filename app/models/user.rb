class User < ActiveRecord::Base
#	acts_as_viewer
	
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model

  # attr_accessible :name

  # attr_accessible :title, :body
	
	has_many :fowls 
  has_many :profile
	has_many :comments
end
