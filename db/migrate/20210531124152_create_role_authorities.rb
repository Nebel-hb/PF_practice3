class CreateRoleAuthorities < ActiveRecord::Migration[5.2]
  def change
    create_table :role_authorities do |t|
      t.bigint :role_id, comment: 'ロールID'
      t.bigint :auth_id, comment: '権限ID'
      t.timestamp :created_at
      t.timestamp :updated_at
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
