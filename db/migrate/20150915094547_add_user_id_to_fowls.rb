class AddUserIdToFowls < ActiveRecord::Migration
  def change
    add_column :fowls, :user_id, :integer
    add_index :fowls, :user_id
  end
end
