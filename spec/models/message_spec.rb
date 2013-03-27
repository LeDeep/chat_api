require 'spec_helper'

describe Message do
  it {should validate_presence_of :screen_name}
  it {should validate_presence_of :comment}
  it {should allow_mass_assignment_of :screen_name}
  it {should allow_mass_assignment_of :comment}

  it {should belong_to :chat_room}
end