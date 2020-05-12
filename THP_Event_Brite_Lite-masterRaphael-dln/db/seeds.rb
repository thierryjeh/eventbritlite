# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#User.destroy_all
#Event.destroy_all

1.times do 
  @user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Hipster.sentence,  
    email: Faker::Internet.email(domain: 'yopmail.com'),
    encrypted_password: "bonjour",
    )
end
puts "Tes users sont dans la place"

1.times do
  @event = Event.create(
    start_date: Faker::Date.forward(days: 360),
    duration: [15, 30, 45, 60, 90, 120, 150].sample,
    title: Faker::Book.title,
    description: Faker::Lorem.sentences(number: 2, supplemental: true),
    price: rand(1..1000),
    location: Faker::Address.city,
    admin: User.all.sample,
  )
end
puts "Tes events sont créés"


1.times do
  @attendance = Attendance.create(
    stripe_customer_id: "bonjourbisous",
    guest: User.all.sample,
    event: Event.all.sample,
  )
end

puts "C'est bon pour les participations"