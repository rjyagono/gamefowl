class FowlCategory < ActiveRecord::Base

  has_many :fowls
  belongs_to :user

end
