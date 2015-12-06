class CreateMedia < ActiveRecord::Migration
  def change
    create_table :media do |t|
      t.string :type
      t.string :name
      t.string :creator
      t.string :description
      t.integer :upvotes

      t.timestamps null: false
    end
  end
end
