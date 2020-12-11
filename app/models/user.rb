class User < ApplicationRecord
  validates :username, :email, presence: true
  has_many :events, foreign_key: 'user_id'
  has_many :attendances, foreign_key: ':user_id'
  has_many :attended_events, class_name: 'Event', through: :attendances

  def user_comming_events
    events.upcoming_events
  end

  def user_past_events
    events.previous_events
  end
end
