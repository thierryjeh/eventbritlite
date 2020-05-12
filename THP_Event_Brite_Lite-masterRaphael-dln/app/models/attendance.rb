class Attendance < ApplicationRecord
  belongs_to :guest, class_name: "User"
  belongs_to :event
  validates :guest_id, uniqueness: { scope: [:event_id] }
  after_create :new_attendee_send

  def new_attendee_send
    AdminMailer.new_attendance(self).deliver_now
  end
end
 