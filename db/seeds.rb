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
  name: "The Trusty #{Faker::Name.middle_name}",
  location: "South Dock, Rotherhithe, London",
  craft_type: 'Hover',
  price_per_day: (250..400).to_a.sample,
  user: user
)
file1 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622558282/boat1.jpg')
list1.photo.attach(io: file1, filename: 'boat1.jpg', content_type: 'jpg')
list1.save!

list2 = Listing.new(
  name: "The #{Faker::Name.middle_name}",
  location: "Poole Harbour, Poole",
  craft_type: 'Frigate',
  price_per_day: (400..600).to_a.sample,
  user: user
)
file2 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622555824/boat2.jpg')
list2.photo.attach(io: file2, filename: 'boat2.jpg', content_type: 'jpg')
list2.save!

list3 = Listing.new(
  name: "The Roving #{Faker::Name.middle_name}",
  location: "Port of Dover, Dover",
  craft_type: 'Super Yacht',
  price_per_day: (300..450).to_a.sample,
  user: user
)
file3 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622556830/boat3.jpg')
list3.photo.attach(io: file3, filename: 'boat3.jpg', content_type: 'jpg')
list3.save!

list4 = Listing.new(
  name: "The Proud #{Faker::Name.middle_name}",
  location: "Port of Calais, Calais",
  craft_type: 'Cruise Liner',
  price_per_day: (900..1100).to_a.sample,
  user: user2
)
file4 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622560930/boat4.jpg')
list4.photo.attach(io: file4, filename: 'boat4.jpg', content_type: 'jpg')
list4.save!

list5 = Listing.new(
  name: "The #{Faker::Name.middle_name}",
  location: "Saint-François, Le Havre",
  craft_type: 'Pleasure Boat',
  price_per_day: (100..150).to_a.sample,
  user: user2
)
file5 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622627410/boat5.jpg')
list5.photo.attach(io: file5, filename: 'boat5.jpg', content_type: 'jpg')
list5.save!

list6 = Listing.new(
  name: "The Cumbersome #{Faker::Name.middle_name}",
  location: "Great Yarmouth",
  craft_type: 'Log',
  price_per_day: (1..3).to_a.sample,
  user: user2
)
file6 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622627414/boat6.jpg')
list6.photo.attach(io: file6, filename: 'boat6.jpg', content_type: 'jpg')
list6.save!

list7 = Listing.new(
  name: "The Mighty #{Faker::Name.middle_name}",
  location: "Chichester",
  craft_type: 'Row Boat',
  price_per_day: (7..15).to_a.sample,
  user: user3
)
file7 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622716238/boat7.jpg')
list7.photo.attach(io: file7, filename: 'boat7.jpg', content_type: 'jpg')
list7.save!

list8 = Listing.new(
  name: "The #{Faker::Name.middle_name}",
  location: "Mallorca",
  craft_type: 'Crusier',
  price_per_day: (80..120).to_a.sample,
  user: user3
)
file8 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622801352/boat8.jpg')
list8.photo.attach(io: file8, filename: 'boat8.jpg', content_type: 'jpg')
list8.save!

list9 = Listing.new(
  name: "Dexterous #{Faker::Name.middle_name}",
  location: "Devon",
  craft_type: 'Row Boat',
  price_per_day: (8..25).to_a.sample,
  user: user3
)
file9 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622801355/boat9.jpg')
list9.photo.attach(io: file9, filename: 'boat9.jpg', content_type: 'jpg')
list9.save!

list10 = Listing.new(
  name: "The #{Faker::Name.middle_name}",
  location: "Calais",
  craft_type: 'Row Boat',
  price_per_day: (10..25).to_a.sample,
  user: user3
)
file10 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622801360/boat10.jpg')
list10.photo.attach(io: file10, filename: 'boat10.jpg', content_type: 'jpg')
list10.save!

list11 = Listing.new(
  name: "One and only #{Faker::Name.middle_name}",
  location: "Tenerife",
  craft_type: 'Cruiser Yacht',
  price_per_day: (200..350).to_a.sample,
  user: user4
)
file11 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622801362/boat11.jpg')
list11.photo.attach(io: file11, filename: 'boat11.jpg', content_type: 'jpg')
list11.save!

list12 = Listing.new(
  name: "My Fair #{Faker::Name.middle_name}",
  location: "Gran Canaria",
  craft_type: 'Yacht',
  price_per_day: (500..600).to_a.sample,
  user: user4
)
file12 = URI.open('https://res.cloudinary.com/dqxvijnu9/image/upload/v1622801364/boat12.jpg')
list12.photo.attach(io: file12, filename: 'boat12.jpg', content_type: 'jpg')
list12.save!
puts "created listings"
