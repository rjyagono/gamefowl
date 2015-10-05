class Fowl < ActiveRecord::Base
	acts_as_votable
	acts_as_viewable
	
	attr_accessible :description, :title, :image
	
	has_many :comments
	belongs_to :user
	
	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100#" }
	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
		
end
