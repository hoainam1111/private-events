class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :attendances
  has_many :attendees, through: :attendances, source: :user
  def self.past
    where('date < ?', Date.today).order(date: :desc)
  end

  # Class method to get upcoming events
  def self.upcoming
    where('date >= ?', Date.today).order(date: :asc)
  end
end
