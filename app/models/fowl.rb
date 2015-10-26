class Fowl < ActiveRecord::Base
	acts_as_votable
#	acts_as_viewable
	
	default_scope :order => 'created_at desc'
	
	attr_accessible :description, :title, :image, :price, :age, :contact_number, :image_delete, :video, :video_delete, :dependent => :destroy
	
	has_many :comments
	belongs_to :user
	belongs_to :profile
	
	has_attached_file :image, styles: { :thumb => "600x600#", :medium => "300x300#", :small => "160x160#" }
	has_attached_file :video
	
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/ 
	validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
	
	validates_uniqueness_of :title
	validates_presence_of :title, :description
	
		
end
