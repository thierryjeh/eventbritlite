# frozen_string_literal: true

cities = %w[Paris Bordeaux Lyon Lisbonne Madrid Annecy]

User.destroy_all
Event.destroy_all
Attendance.destroy_all

users = []
events = []

1.times do |i|
  users << User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: 'ozokuko-2767@yopmail.com',
    description: Faker::Lorem.paragraphs,
    encrypted_password: 'test'
  )

  puts "#{i + 1}/30 utilisateurs créés"
end

10.times do |i|
  events << Event.create!(
    # start_date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
    start_date: Time.parse('2020-08-12'),
    duration: 5 * rand(1..100),
    title: Faker::Name.name,
    description: Faker::Lorem.paragraphs,
    price: rand(1..999),
    location: cities.sample,
    author: User.last
  )

  puts "#{i + 1}/10 évènements créés"
end

10.times do |i|
  Attendance.create!(
    user: users.sample,
    event: events.sample
  )

  puts "#{i + 1}/10 participations créés"
end
