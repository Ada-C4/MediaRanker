class AddDefaults < ActiveRecord::Migration
  def change
    change_column_default(:books, :upvotes, 0)
    change_column_default(:movies, :upvotes, 0)
  end
end
