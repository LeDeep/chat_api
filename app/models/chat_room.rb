class ChatRoom < ActiveRecord::Base

  attr_accessible :started_by, :topic

  validates :started_by, :topic, :presence => true
  
  has_many :messages
end