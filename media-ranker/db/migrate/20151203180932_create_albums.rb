class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :rank
      t.string :title
      t.string :artist
      t.string :description

      t.timestamps null: false
    end
  end
end
