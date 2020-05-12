class UserMailer < ApplicationMailer
  default from: 'no-reply@eventbrite.fr'

  def welcome_email(user)
    @user = user
    @url  = 'https://eventbride-thp-copycat.herokuapp.com/login'
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end
