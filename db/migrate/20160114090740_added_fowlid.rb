class AddedFowlid < ActiveRecord::Migration
  def change
  	add_column :photos, :fowl_id, :integer
  end
end
