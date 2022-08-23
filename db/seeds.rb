# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# puts "Cleaning database..."
# Dragon.destroy_all
require "faker"

puts "Creating dragons..."

5.times do |n|
  user = User.create!(
  email: Faker::Internet.email,
  password: 123456
)
  10.times do |n|
      Dragon.create!(
      name: Faker::TvShows::GameOfThrones.dragon.capitalize,
      power: ["Enhanced Senses", "Enhanced Speed", "Flight", "Pyrokinesis", "Shapeshifting", "Combat", "Bake Cookies", "Drink Fire", "Super Healer", "Super Nanny", "Plant Propagator", "Super Fire Extinguisher", "Super Nice Taco Maker", "Super Debugger", "Super Drinker" ].shuffle.first,
  age: rand(1..1500),
      level: rand(1..10),
      price: rand(5..500),
      user: user
  )
  end
end



puts "Finished!"
