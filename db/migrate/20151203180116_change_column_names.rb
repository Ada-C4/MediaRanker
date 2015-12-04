class ChangeColumnNames < ActiveRecord::Migration
  def change
    rename_column(:movies, :director, :creator)
    rename_column(:albums, :artist, :creator)
    rename_column(:books, :author, :creator)
  end
end
