class Message < ActiveRecord::Base

  attr_accessible :screen_name, :comment

  validates :screen_name, :comment, :presence => true
  
end