class Event < ApplicationRecord
  has_many :attendances
  has_many :guests, class_name: "User", through: :attendances
  belongs_to :admin, class_name: "User" 
  validates :start_date, presence: true
  validate :start_must_be_future

  validates :duration, presence: true
  validate :duration_5
  validate :duration_positive

  validates :title, presence: true, length: { in: 5..140 }
  validates :description, presence: true, length: { in: 20..1000 }
  validates :price, presence: true, inclusion: { in: 1..1000}
  validates :location, presence: true


  def start_must_be_future
    return unless start_date 
    errors.add(:start_date, "ne doit pas être passée") unless start_date > Time.now
  end

  def duration_5
    return unless duration
    errors.add(:duration, "doit être un multiple de 5") unless (duration % 5) == 0
  end
  
  def duration_positive
    return unless duration
    errors.add(:duration, "doit être supérieur à 0") unless duration > 0
  end
end
 