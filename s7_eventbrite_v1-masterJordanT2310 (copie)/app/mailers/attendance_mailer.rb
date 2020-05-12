class AttendanceMailer < ApplicationMailer
  default from: 'jo.tournerie@gmail.com'

  def attendance_email(attendance)
    @attendance = attendance
    @url = 'https://eventbrite-de-jojo.herokuapp.com/event/'
    mail(to: @attendance.user.email, subject: "Tu es inscris à l'évènement #{@attendance.event}")
  end
end
