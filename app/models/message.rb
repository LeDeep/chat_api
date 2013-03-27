class Message < ActiveRecord::Base

  attr_accessible :screen_name, :comment

  validates :screen_name, :comment, :presence => true
  
  belongs_to :chat_room
  
end