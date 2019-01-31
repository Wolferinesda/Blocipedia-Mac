require 'random_data'
require 'faker'
# Create Users
5.times do
  User.create!(
  email:    Faker::Internet.email,
  password: Faker::Games::LeagueOfLegends.quote
  )
end
users = User.all

 # Create Wikis
50.times do
  Wiki.create!(
    user:   users.sample,
    title:  Faker::Games::WorldOfWarcraft.hero,
    body:   Faker::Number.number(25),
    private: false
  )
end
  wikis = Wiki.all
  user = User.first
  user.update_attributes!(
  email: 'olienad@yahoo.com',
  password: '123123'
)

admin = User.create!(
  email: 'admin@example.com',
  password: 'helloworld',
  role: 'admin'
)

standard = User.create!(
  email: 'standard@example.com',
  password: 'helloworld'
)

premium = User.create!(
  email: 'premium@example.com',
  password: 'helloworld',
  role: 'premium'
)

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
