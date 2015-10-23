class Contact < ActiveRecord::Base
  attr_accessible :email

	validates :email, presence: true
	validates :email, :format => {  :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
																:if => Proc.new { |o|  o.email }
														 }
end
