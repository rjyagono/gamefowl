class CreateFowlCategories < ActiveRecord::Migration
  def change
    create_table :fowl_categories do |t|
    	t.string :name
      
      t.timestamps null: false
    end
  end
end
