require 'faker'

puts "Lets seed the db..."

# seed users
25.times do
  User.create!(
    email: "#{Faker::Name.first_name}@yopmail.com",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph)
end

# a range of time
t1 = Time.now + 60000
t2 = t1 + 6000000

# seed events
5.times do
  Event.create!(
    start_date: rand(t1..t2),
    duration: rand(1..100)*5,
    description: Faker::Lorem.paragraph_by_chars,
    location: Faker::Address.city,
    price: rand(1..1000),
    title: Faker::Marketing.buzzwords,
    admin_id: User.all.sample.id)
end

# seed attendances for each event
Event.all.each do |event|
  rand(5..10).times do
    Attendance.create!(
      user: User.all.sample,
      event: event)
    end
end

puts "Done!"
