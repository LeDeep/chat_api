require 'spec_helper'

describe ChatRoom do
  it {should validate_presence_of :started_by}
  it {should validate_presence_of :topic}
  it {should allow_mass_assignment_of :started_by}
  it {should allow_mass_assignment_of :topic}
  it {should have_many :messages}
end