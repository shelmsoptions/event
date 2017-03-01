class Event < ApplicationRecord
  belongs_to :user
  has_many :joins
  has_many :users_joined, through: :joins, source: :user
  has_many :discussions

  validates :name, :location, :location_state, :date, presence: true


end
