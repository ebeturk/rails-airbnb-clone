require "open-uri"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# file = URI.open('')
puts "Cleaning database..."
Faker::Config.locale = 'de'
Booking.destroy_all
Dragon.destroy_all
User.destroy_all

require "faker"

puts "Creating dragons..."

4.times do |n|
  user = User.create(
    email: Faker::Internet.email,
    password: 123456
  )
  5.times do |i|
      dragon = Dragon.new(
        address: Faker::Address.street_address,
        name: Faker::TvShows::GameOfThrones.dragon.capitalize,
        power: ["Enhanced Senses", "Enhanced Speed", "Flight", "Pyrokinesis", "Shapeshifting", "Combat", "Bake Cookies", "Drink Fire", "Super Healer", "Super Nanny", "Plant Propagator", "Super Fire Extinguisher", "Super Nice Taco Maker", "Super Debugger", "Super Drinker", "Yells at You", "Wakes you Up" ].shuffle.first,
        age: rand(1..1500),
        level: rand(1..10),
        price: rand(5..500),
        user: user
      )
      itr = rand(1..29)
      puts itr
    dragon.photo.attach(io: URI.open(Cloudinary::Search.expression('folder=Drago').execute["resources"][itr]["url"]), filename: Cloudinary::Search.expression('folder=Drago').execute["resources"][itr]["filename"], content_type: "image/#{Cloudinary::Search.expression('folder=Drago').execute["resources"][itr]["format"]}")
    dragon.save
  end
end



puts "Finished!"
