class AddVideoFieldsOnFowls < ActiveRecord::Migration
  def self.up
    change_table :fowls do |t|
      t.string :video
    end
  end

  def self.down
    drop_attached_file :fowls, :video
  end
end
