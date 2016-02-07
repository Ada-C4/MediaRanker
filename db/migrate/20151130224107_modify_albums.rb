class ModifyAlbums < ActiveRecord::Migration
  def change
    change_table :albums do |t|
      change_column :albums, :votes, :integer, default: 0
    end
  end
end
