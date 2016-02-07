class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :kind
      t.string :name
      t.string :creator
      t.string :description
      t.integer :votes, default: 0

      t.timestamps null: false
    end
  end
end
