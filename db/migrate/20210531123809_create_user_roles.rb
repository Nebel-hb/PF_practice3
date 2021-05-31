class CreateUserRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_roles do |t|
      t.bigint :user_id, comment: 'ユーザーID'
      t.bigint :role_id, comment: 'ロールID'
      t.timestamp :created_at
      t.timestamp :updated_at
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
