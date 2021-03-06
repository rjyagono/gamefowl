class User < ActiveRecord::Base
#	acts_as_viewer
	
  # attr_method :image_changed?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_presence_of :email

  # mount_uploader :image, ImageUploader, :mount_on => :image
  # has_many :authorizations

  # Setup accessible (or protected) attributes for your model

  # attr_accessible :name

  # attr_accessible :title, :body
	
	has_many :fowls 
  # has_many :profile 
	has_many :comments

  def self.new_with_session(params,session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"],without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

 #  def self.from_omniauth(auth, current_user)
 #    authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
 #    if authorization.user.blank?
 #      user = current_user || User.where('email = ?', auth["info"]["email"]).first
 #      if user.blank?
 #       user = User.new
 #       user.password = Devise.friendly_token[0,10]
 #       user.name = auth.info.name
 #       user.email = auth.info.email
 #       if auth.provider == "twitter" 
 #         user.save(:validate => false) 
 #       else
 #         user.save
 #       end
 #     end
 #     authorization.username = auth.info.nickname
 #     authorization.user_id = user.id
 #     authorization.save
 #   end
 #   authorization.user
 # end

 def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
  end

end
