class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.integer :orchestra_id
      t.text :room_introduction
      t.timestamps
    end
  end
end
