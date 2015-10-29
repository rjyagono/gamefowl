class AddingContactsAndLocationFieldsOnUsers < ActiveRecord::Migration
  def change
  	add_column :users, :contact_number, :integer
  	add_column :users, :location, :string
  	add_column :fowls, :weigth, :float
  end
end
