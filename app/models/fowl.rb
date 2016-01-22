class Fowl < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	mount_uploader :video, VideoUploader
#	acts_as_votable
#	acts_as_viewable --not includeed---
	
	default_scope { order(created_at: 'desc') }
	
	# #attr_accessible :description, :title, :image, :price, :age, :contact_number, :image_delete, :video, :video_delete, :dependent => :destroy
	has_many :photos
	has_many :comments
	belongs_to :category, class_name: :FowlCategory, foreign_key: :fowl_category_id
	belongs_to :user
	belongs_to :profile
	
	# # has_attached_file :image, styles: { :thumb => "600x600#", :medium => "300x300#", :small => "160x160#" }
	# has_attached_file :image, styles: { :thumb => "400x400#", :medium => "200x200#", :small => "100x100#" }, default_url: "/images/missing.png"
	# has_attached_file :video

	# # has_attached_file :video, :styles => {
 # #    	:medium => { :geometry => "640x480", :format => 'mp4' },
 # #    	:thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
	# # }
	
	# validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/ 
	# validates_attachment_content_type :video, content_type: /\Avideo\/.*\Z/
	
	# validates_uniqueness_of :title
	# validates_presence_of :title, :description

	# def primary_photo
	# 	if photos
	# 		photos).try(:first)
	# 	else
			
	# 	end
	# end
	
		
end
