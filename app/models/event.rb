class Event < ApplicationRecord
  belongs_to :user
  has_many :joins
  has_many :users_joined, through: :joins, source: :user
  has_many :discussions

  validate :date_must_be_post_current

  def date_must_be_post_current
    if date.present? && date < Date.today
      errors.add(:date, "must be later than today!!")
    end
  end

  validates :name, :location, :location_state, :date, presence: true


end
