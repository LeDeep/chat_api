class MessagesController < ApplicationController

  def create
    message = Message.create(params[:message])

    if message.save
      render :json => message, :status => :created
    else
      render :json => message.errors, :status => :unprocessable_entity
    end
  end

  def index
    # latest_messages = Message.limit(15).offset(Message.count-15).order("created_at ASC")
    # messages = Message.all
    messages = Message.where("chat_room_id = ?", params[:message][:chat_room_id])
    render :json => messages
  end

end