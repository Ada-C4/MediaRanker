class AddVotesToBook < ActiveRecord::Migration
  def change
  	add_column(:books, :votes, :integer)
  end
end
