class Role < ApplicationRecord
  has_many :user_roles, foreign_key: :role_id
  has_many :users, through: :user_roles
  has_many :role_authorities, foreign_key: :role_id
  has_many :authorities, through: :role_authorities
end
