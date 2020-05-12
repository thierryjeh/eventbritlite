require 'date'

class Event < ApplicationRecord
  has_many :attendances
  has_many :users, through: :attendances

  validates :start_date,
    presence: true
  validate :start_date_future?
  validates :duration,
    presence: true,
    numericality: { only_integer: true, greater_than: 0 }
  validate :multiple_of_5?
  validates :title,
    presence: true,
    length: { in: 5..140 }
  validates :description,
    presence: true,
    length: { in: 20..1000 }
  validates :price,
    presence: true,
    numericality: { only_integer: true, greater_than: 0, less_than: 1001 }
  validates :location,
    presence: true

  private

  def start_date_future?
    errors.add(:start_date, "L'event doit avoir une date de début future.") if self.start_date <= DateTime.now()
  end

  def multiple_of_5?
      errors.add(:duration, "La durée doit être un multiple de 5 minutes.") unless self.duration % 5 == 0
  end

end
