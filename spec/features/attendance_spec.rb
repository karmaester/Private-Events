require 'rails_helper'

RSpec.describe Attendance, type: :model do
  it 'is not valid if user id is not provided' do
    user = User.create(username: 'thisisatest', email: 'test@t.com')
    event = Event.create(name: 'Event', user_id: user.id)
    expect(Attendance.new(event_id: event.id)).to_not be_valid
  end

  it 'is not valid if event id is not provided' do
    user = User.create(username: 'thisisatest', email: 'test@t.com')
    expect(Attendance.new(user_id: user.id)).to_not be_valid
  end

  it 'is valid if event and user id are provided' do
    user = User.create(username: 'thisisatest', email: 'test@t.com')
    event = Event.create(name: 'Event', location: 'test', description: 'test', user_id: user.id)
    expect(Attendance.new(event_id: event.id, user_id: user.id)).to be_valid
  end
end
