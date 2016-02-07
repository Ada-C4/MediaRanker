class ChangeKind < ActiveRecord::Migration
  def change
    change_table :media do |t|
      rename_column :media, :kind, :type
    end
  end
end
