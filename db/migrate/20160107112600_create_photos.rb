class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
			t.string :title
      t.text :description
      t.string :mobile_number
      t.string :age
      t.string :type
      t.string :image
      t.integer :source_id
      t.integer :user_id
     
      t.timestamps null: false
    end
  end
end
