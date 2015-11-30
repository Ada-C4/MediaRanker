class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :author
      t.integer :ranking

      t.timestamps null: false
    end
  end
end
