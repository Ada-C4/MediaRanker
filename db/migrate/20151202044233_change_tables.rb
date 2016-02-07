class ChangeTables < ActiveRecord::Migration
  def change
    drop_table :albums
    drop_table :books
    drop_table :movies
  end
end
