class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @chats = @room.chats
    # UserRoom.create(user_id: params[:user_id], room_id: params[:room_id])

  end

  def index
    @users = User.all
    @rooms = Room.where(orchestra_id: 1)
    @room = Room.new
    @room_all = Room.all
    # @room_all = current_user.rooms
    # @rooms = current_user.rooms
    @nonrooms = Room.where(id: UserRoom.where.not(user_id: current_user.id).pluck(:id))
  end
  
  def create
    @room = Room.new(room_params)
    @room.save
    current_user.user_rooms.create(room_id: @room.id)
    redirect_to @room
  end
end
