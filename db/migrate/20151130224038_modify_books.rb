class ModifyBooks < ActiveRecord::Migration
  def change
    change_table :books do |t|
      change_column :books, :votes, :integer, default: 0
    end
  end
end
