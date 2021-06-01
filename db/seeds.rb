# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
require "open-uri"

puts "destroy old seed"
User.destroy_all
Listing.destroy_all
puts "destroyed"

user = User.create!(
name: "testing",
email: "test@test.com",
password: "secret"
)

puts "created user"

6.times do
  list = Listing.new(
    name: "The #{Faker::Name.middle_name}",
    location: Faker::Address.city,
    craft_type: Faker::Vehicle.make,
    price_per_day: (0..1000).to_a.sample,
    user: user
  )
  file = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622558282/boat1.jpg')
  list.photo.attach(io: file, filename: 'boat1.jpg', content_type: 'jpg')
  list.save!
end
puts "created listings"
