class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content
      t.references :fowl
      t.references :user

      t.timestamps
    end
    add_index :comments, :fowl_id
    add_index :comments, :user_id
  end
end
