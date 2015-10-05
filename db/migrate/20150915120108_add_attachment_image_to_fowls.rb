class AddAttachmentImageToFowls < ActiveRecord::Migration
  def self.up
    change_table :fowls do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :fowls, :image
  end
end
