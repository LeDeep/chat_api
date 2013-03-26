class Message < ActiveRecord::Base

  attr_accessible :screen_name, :comment

  validates :screen_name, :comment, :presence => true

  #scope :recent, limit(20).order("created_at ASC")

  
end