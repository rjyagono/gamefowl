class AddColumnFowlCategoryIdInFowls < ActiveRecord::Migration
  def change
    add_column :fowls, :fowl_category_id, :integer
  end
end
