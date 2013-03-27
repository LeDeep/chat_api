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
    chat_rooms = ChatRoom.all
    render :json => chat_rooms
  end

  def show
    chat_room = ChatRoom.find(params[:id])
    render :json => chat_room
  end

end