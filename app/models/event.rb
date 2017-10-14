class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  validates :title, presence: true, length: { minimum: 6, maximum: 140 }
  validates :description, presence: true, length: { minimum: 40, maximum: 500 }
  validates :date, presence: true
  validates :time,  presence: true
  validates :location, presence: true
end