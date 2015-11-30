class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title
      t.text :description
      t.string :artist
      t.integer :ranking

      t.timestamps null: false
    end
  end
end
