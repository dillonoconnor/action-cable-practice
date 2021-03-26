# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NOUNS = ["Astronauts", "Players", "Gamers", "Ballers", "Professionals", "Workers", "Weavers", "Artists", "Animals"]
ADJECTIVES = ["Huge", "Amazing", "Exceptional", "Lazy", "Wondrous", "Mysterious", "Magical", "Serious", "Somber"]

1.upto(10) { |i| Room.create!(name: "#{ADJECTIVES.sample} #{NOUNS.sample} - #{i}") }

