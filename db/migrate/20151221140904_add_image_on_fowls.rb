class AddImageOnFowls < ActiveRecord::Migration
  def change
   	add_column :fowls, :image, :string
   	add_column :fowls, :type, :string
   	add_column :fowls, :source_id, :integer
   	add_column :fowls, :video, :string
  end
end
