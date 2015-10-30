class ChangeType < ActiveRecord::Migration
   def up
   	remove_column :users ,:contact_number
  end

end
