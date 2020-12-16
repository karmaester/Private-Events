class Event < ApplicationRecord
  validates :name, :description, :location, presence: true
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendances
  has_many :attendees, class_name: 'User', through: :attendances, source: :user, dependent: :delete_all

  scope :upcoming_events, -> { where(['events.date > ?', Date.today]) }
  scope :previous_events, -> { where(['events.date <= ?', Date.today]) }
end
