class Message < ActiveRecord::Base

  attr_accessible :screen_name, :comment, :chat_room_id

  validates :screen_name, :comment, :chat_room_id, :presence => true
  
  belongs_to :chat_room

end