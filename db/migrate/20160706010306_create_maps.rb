class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|
      t.string :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
      add_index :maps, :user_id
  end
end
