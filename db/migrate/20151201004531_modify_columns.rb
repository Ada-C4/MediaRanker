class ModifyColumns < ActiveRecord::Migration
  def change
    change_table :albums do |t|
      rename_column :albums, :artist, :creator
    end
    change_table :books do |t|
      rename_column :books, :author, :creator
    end
    change_table :movies do |t|
      rename_column :movies, :director, :creator
    end
  end
end
