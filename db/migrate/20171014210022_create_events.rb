class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :creator_id
      t.string :title
      t.text :description
      t.date :date
      t.string :location
      t.time :time

      t.timestamps
    end
    add_index :events, :creator_id
  end
end
