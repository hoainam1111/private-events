class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
  # Scope to get past events
  scope :past, -> { where('date < ?', Date.today).order(date: :desc) }

  # Scope to get upcoming events
  scope :upcoming, -> { where('date >= ?', Date.today).order(date: :asc) }
  
end
