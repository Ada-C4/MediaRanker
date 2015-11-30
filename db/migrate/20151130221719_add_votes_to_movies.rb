class AddVotesToMovies < ActiveRecord::Migration
  def change
    add_column :movies, :votes, :integer
  end
end
