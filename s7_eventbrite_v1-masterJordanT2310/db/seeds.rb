User.destroy_all
Event.destroy_all
Attendance.destroy_all

# User.create(first_name: 'jojo', last_name: 'toto', description: Faker::Hipster.sentence, email: 'jo.tournerie@gmail.com', encrypted_password: Faker::Internet.password(min_length: 8))

20.times do |i|
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Hipster.sentence, email: 'example_' + i.to_s + '@yolo.com', password: Faker::Internet.password(min_length: 8))
end

5.times do
  Event.create(start_date: Faker::Date.forward(days: 30), duration: Faker::Number.between(from: 1, to: 10) * 5, title: Faker::Hipster.sentence(word_count: 3), description: Faker::Hipster.sentence(word_count: 6), price: Faker::Number.within(range: 1..1000), location: 'Bordeaux')
end

20.times do
  Attendance.create(user: User.all[rand(0..19)], event: Event.all[rand(0..4)], stripe_customer_id: Faker::Number.within(range: 1..1000))
end
