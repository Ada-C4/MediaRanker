class AddDefaultToBook < ActiveRecord::Migration
  def change
    change_column_default(:albums, :upvotes, 0)
  end
end
