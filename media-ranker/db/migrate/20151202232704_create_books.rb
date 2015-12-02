class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.integer :rank
      t.string :title
      t.string :author
      t.string :description

      t.timestamps null: false
    end
  end
end
