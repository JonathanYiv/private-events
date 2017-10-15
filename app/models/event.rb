class Event < ApplicationRecord
  default_scope { order(start_time: :asc) }
  scope :past_events, -> { where('start_time < ?', DateTime.current) }
  scope :future_events, -> { where('start_time > ?', DateTime.current) }

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  has_many :attendances
  has_many :attendees, through: :attendances, source: :user

  has_many :invitations

  validates :title, presence: true, length: { minimum: 6, maximum: 140 }
  validates :description, presence: true, length: { minimum: 40, maximum: 1500 }
  validates :start_time, presence: true
  validates :location, presence: true
end