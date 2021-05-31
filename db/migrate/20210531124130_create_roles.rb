class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.string :name, comment: 'ロール名'
      t.timestamp :created_at
      t.timestamp :updated_at
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
