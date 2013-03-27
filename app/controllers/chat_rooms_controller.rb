class ChatRoomsController < ApplicationController

  def create
    chat_room = ChatRoom.create(params[:chat_room])

    if chat_room.save
      render :json => chat_room, :status => :created
    else
      render :json => chat_room.errors, :status => :unprocessable_entity
    end
  end

  def index
    # latest_messages = Message.limit(15).offset(Message.count-15).order("created_at ASC")
    chat_rooms = ChatRoom.all
    render :json => chat_rooms
  end

end