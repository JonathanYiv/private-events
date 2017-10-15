class User < ApplicationRecord
  has_many :hosted_events, class_name: 'Event', foreign_key: 'creator_id'

  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true, length: { minimum: 6, maximum: 140 }
end
