class AddFieldsOnContacts < ActiveRecord::Migration
  def change		
  	add_column :contacts, :message, :text
  	add_column :contacts, :name, :string
  	add_column :contacts, :phone, :string
  	add_column :contacts, :fowl_id, :integer
  	add_column :contacts, :to_owner_id, :integer
  end
end
