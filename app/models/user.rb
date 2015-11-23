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

  # def self.sign_in_from_omniauth(auth)
  #   find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  # end

  # def self.create_user_from_omniauth(auth)
  #   create(
  #       provider: auth['provider'],
  #       uid: auth['uid'],
  #       name: auth['info']['name']
  #     )
  # end
  # validates_numerically  :contact_number, :in => 1..12
end
