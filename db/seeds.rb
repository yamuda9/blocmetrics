# Create member for testing
membertest = User.create!(
  email: 'member@example.com',
  password: 'helloworld'
)

membertest.confirm!

# Create Users
5.times do
  user = User.create!(
    email:    Faker::Internet.email,
    password: Faker::Internet.password
  )
  user.confirm!
end

users = User.all

# Create Apps
5.times do
  app = RegisteredApplication.create!(
  user: users.sample,
  name: Faker::App.name,
  url:  Faker::Internet.url
  )
  # Create Events
  rand(1..5).times { Event.create!(registered_application_id: app.id, name: Faker::Hacker.noun) }
end

apps = RegisteredApplication.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} apps created"
puts "#{Event.count} events created"
