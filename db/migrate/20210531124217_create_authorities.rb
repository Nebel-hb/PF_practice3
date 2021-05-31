class CreateAuthorities < ActiveRecord::Migration[5.2]
  def change
    create_table :authorities do |t|
      t.string :name, comment: '画面名'
      t.string :permission, comment: 'パーミッション'
      t.timestamp :created_at
      t.timestamp :updated_at
      t.timestamp :deleted_at
      t.timestamps
    end
  end
end
