class RoleAuthority < ApplicationRecord
  belongs_to :role, foreign_key: :role_id, optional: true
  belongs_to :authority, foreign_key: :auth_id, optional: true
end
