class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.text :description
      t.integer :ranked, default: 0

      t.timestamps null: false
    end
  end
end
