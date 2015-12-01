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

books = [
  { name: "Curious George", author: "George the Curious", description: "A monkey is a badass the end", rank: 4},
  { name: "Tacos Till You Die", author: "Tanner Schmidt", description: "Will I ever not like tacos? Probably not.", rank: 3}
  { name: "Are You There God? It's Me, a Slytherin", author: "Brit Kohler", description: "A memoir translated from the original parseltongue poop dialect!", rank: 6}
]

books.each do |book|
  Book.create book
end

albums = [
  { name: "All My Ada Ladies", artist: "Beyonce", description: "A rousing anthem sure to get any party started.", rank: 4},
  { name: "1990", author: "Tanner Schmidt", description: "A better take on TayTay", rank: 7}
  { name: "The Harry Potters", author: "Hermione Granger", description: "Nitwit! Blubbler! Oddment! Tweark!", rank: 6}
]

albums.each do |album|
  Album.create album
end
