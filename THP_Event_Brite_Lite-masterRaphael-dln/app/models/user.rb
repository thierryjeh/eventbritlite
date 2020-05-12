class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  has_many :guest_attendances, foreign_key: 'guest_id', class_name: "Attendance"
  has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"
  after_create :welcome_send

  def welcome_send
    UserMailer.welcome_email(self).deliver_now
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
