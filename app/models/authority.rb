class Authority < ApplicationRecord
  has_many :role_authorities, foreign_key: :auth_id
  has_many :roles, through: :role_authorities
end
