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

50.times do |n|
  puts Dragon.create!(
  name: Faker::TvShows::GameOfThrones.dragon.capitalize,
  power: ["Enhanced Senses", "Enhanced Speed", "Flight", "Pyrokinesis", "Shapeshifting", "Combat", "Bake Cookies", "Drink Fire", "Super Healer", "Super Nanny", "Plant Propagator", "Super Fire Extinguisher", "Super Nice Taco Maker", "Super Debugger", "Super Drinker" ].shuffle.first,
  age: rand(1..1500),
  level: rand(1..10),
  price: rand(5..500),
  user_id: current_user
)
end

puts "Finished!"
