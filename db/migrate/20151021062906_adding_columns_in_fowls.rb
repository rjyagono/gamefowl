class AddingColumnsInFowls < ActiveRecord::Migration
  def change
  	add_column :fowls, :price, :integer
  	add_column :fowls, :age, :string
  	add_column :fowls, :contact_number, :integer 
  end
 
end
