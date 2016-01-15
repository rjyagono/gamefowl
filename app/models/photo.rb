class Photo < ActiveRecord::Base
	validates :title, presence: true
	mount_uploader :image, ImageUploader

	belongs_to :fowl

	def self.parse_filename(filename)
    filename.gsub!(/(.jpg|.png)/, '')
    return nil unless filename =~ /^(([a-zA-Z]|[0-9])*(_|$)){1,}/
		filename.split('_').join(' ')
    {title: filename}
  end

end