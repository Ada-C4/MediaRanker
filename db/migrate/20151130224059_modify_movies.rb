class ModifyMovies < ActiveRecord::Migration
  def change
    change_table :movies do |t|
      change_column :movies, :votes, :integer, default: 0
    end
  end
end
