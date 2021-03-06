

class ChatsController < ApplicationController
  def show
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    if user_rooms.nil?
      @room = Room.new
      @room.save
      UserRoom.create(user_id: @user.id, room_id: @room.id)
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
    else
      @room = user_rooms.room
    end
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @room = @chat.room
    @chat.save
    # @roommembernotme = Entry.where(room_id: @room.id).where.not(user_id: current_user.id)
            # @theid = @roommembernotme.find_by(room_id: @room.id)
  #           notification = current_user.active_notifications.new(
  #               room_id: @room.id,
  #               chat_id: @chat.id,
  #               visited_id: @theid.user_id,
  #               visitor_id: current_user.id,
  #               action: 'dm'
  #           )
  #           # 自分の投稿に対するコメントの場合は、通知済みとする
  #           if notification.visitor_id == notification.visited_id
  #               notification.checked = true
  #           end
  #           notification.save if notification.valid?
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end
