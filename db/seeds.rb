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
Booking.destroy_all
Listing.destroy_all
User.destroy_all
puts "destroyed"

user = User.create!(
name: "Chadley",
email: "chad@spotter.com",
password: "secret"
)

user2 = User.create!(
name: "Harry",
email: "harry@spotter.com",
password: "secret"
)

user3 = User.create!(
name: "Tom",
email: "tom@spotter.com",
password: "secret"
)

user4 = User.create!(
name: "Alex",
email: "alex@spotter.com",
password: "secret"
)

puts "created users"

list1 = Listing.new(
  name: "The #{Faker::Name.middle_name}",
  location: "South Dock, Rotherhithe, London",
  craft_type: 'Hover',
  price_per_day: (0..1000).to_a.sample,
  user: user
)
file1 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622558282/boat1.jpg')
list1.photo.attach(io: file1, filename: 'boat1.jpg', content_type: 'jpg')
list1.save!

list2 = Listing.new(
  name: "The #{Faker::Name.middle_name}",
  location: "Poole Harbour, Poole",
  craft_type: 'Frigate',
  price_per_day: (0..1000).to_a.sample,
  user: user
)
file2 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622555824/boat2.jpg')
list2.photo.attach(io: file2, filename: 'boat2.jpg', content_type: 'jpg')
list2.save!

list3 = Listing.new(
  name: "The #{Faker::Name.middle_name}",
  location: "Port of Dover, Dover",
  craft_type: 'Super Yacht',
  price_per_day: (0..1000).to_a.sample,
  user: user
)
file3 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622556830/boat3.jpg')
list3.photo.attach(io: file3, filename: 'boat3.jpg', content_type: 'jpg')
list3.save!

list4 = Listing.new(
  name: "The #{Faker::Name.middle_name}",
  location: "Port of Calais, Calais",
  craft_type: 'Cruise Liner',
  price_per_day: (0..1000).to_a.sample,
  user: user2
)
file4 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622560930/boat4.jpg')
list4.photo.attach(io: file4, filename: 'boat4.jpg', content_type: 'jpg')
list4.save!

list5 = Listing.new(
  name: "The #{Faker::Name.middle_name}",
  location: "Saint-François, Le Havre",
  craft_type: 'Pleasure Boat',
  price_per_day: (0..1000).to_a.sample,
  user: user2
)
file5 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622627410/boat5.jpg')
list5.photo.attach(io: file5, filename: 'boat5.jpg', content_type: 'jpg')
list5.save!

list6 = Listing.new(
  name: "The #{Faker::Name.middle_name}",
  location: "Great Yarmouth",
  craft_type: 'Log',
  price_per_day: (0..1000).to_a.sample,
  user: user2
)
file6 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622627414/boat6.jpg')
list6.photo.attach(io: file6, filename: 'boat6.jpg', content_type: 'jpg')
list6.save!

puts "created listings"