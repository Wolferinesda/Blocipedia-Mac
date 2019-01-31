# Create Users
3.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: Faker::Games::LeagueOfLegends.quote
  )
end
users = User.all

user = User.first
user.update_attributes!(
  email: 'olienad@yahoo.com',
  password: 'helloworld',
  confirmed_at: Time.now
)

# Create Applications
10.times do
  RegisteredApplication.create!(
    name: Faker::Games::LeagueOfLegends.champion,
    url: Faker::Internet.url,
    user: User.first
  )
end
registered_application = RegisteredApplication.all

# Create Events
50.times do
  Event.create!(
    name: Faker::Games::LeagueOfLegends.champion,
    registered_application: registered_application.sample
  )
end

puts "Seed Finished"
puts "#{User.count} users created"
puts "#{RegisteredApplication.count} registered applications created"
puts "#{Event.count} events created"
