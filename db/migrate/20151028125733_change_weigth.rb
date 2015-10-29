class ChangeWeigth < ActiveRecord::Migration
  def change
    rename_column :fowls, :weigth, :weight
  end
end
