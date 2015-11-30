# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  { name: "Adventure Time", director: "Finn", description: "Adventure time...adventure time....", rank: 10},
  { name: "Mean Girls", director: "Tina Fey", description: "She doesn't even go here!", rank: 5 },
  { name: "BlackFish", director: "Jessica Noglows", description: "Jessica saves whales through the magic of film", rank: 4},
]

movies.each do |movie|
  Movie.create movie
end
