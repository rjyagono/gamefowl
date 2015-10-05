class CreateFowls < ActiveRecord::Migration
  def change
    create_table :fowls do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
