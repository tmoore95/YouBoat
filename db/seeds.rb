# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "faker"
require "open-uri"

puts "removing old listings and users."
User.destroy_all
Listing.destroy_all
puts "old seeds removed."

5.times do
  user = User.new(
    username: Faker::Internet.user_name,
    email: Faker::Internet.email
  )
  user.save

  10.times do
    list = Listing.new(
      name: "The #{Faker::Name.middle_name}",
      location: Faker::Address.city,
      craft_type: Faker::Vehicle.make,
      price_per_day: (0..1000).to_a.sample
    )
    list.save
  end
end
puts "listings and users added."
