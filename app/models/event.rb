class Event < ApplicationRecord
  default_scope { order(start_time: :asc) }
  scope :past_events, -> { where('start_time < ?', Time.current) }
  scope :future_events, -> { where('start_time > ?', Time.current) }

  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  validates :title, presence: true, length: { minimum: 6, maximum: 140 }
  validates :description, presence: true, length: { minimum: 40, maximum: 1500 }
  validates :start_time, presence: true
  validates :location, presence: true
end