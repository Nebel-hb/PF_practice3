class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum role: { general: 1, admin: 99 }#cancancan
  
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
  has_many :user_rooms
  has_many :chats
  has_many :rooms, through: :user_rooms
  has_many :user_roles, foreign_key: :user_id
  has_many :roles, through: :user_roles

end
