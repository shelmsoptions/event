class User < ApplicationRecord
  has_secure_password
  has_many :events
  has_many :discussions
  has_many :events_discussed, through: :discussions, source: :event
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :location, :location_state, presence: true
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end