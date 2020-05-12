class AttendanceMailer < ApplicationMailer
   default from: 'evafriana@yopmail.com'

  def attendance_email(user)
    @attendance = attendance
    @url  = 'https://eventbride-thp-copycat.herokuapp.com/login'
    mail(to: @attendance.user.email, subject: "Enjoy #{@attendance.event.title}")
  end
end
