class AddingContacts < ActiveRecord::Migration
	
  def change
   	add_column :users ,:contact_number, :bigint
  end
end
