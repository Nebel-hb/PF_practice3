class CreateUserRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :user_rooms do |t|
      t.integer :user_id
      t.integer :room_id
      t.boolean :activation, default: false, null: false

      t.timestamps
    end
  end
end
