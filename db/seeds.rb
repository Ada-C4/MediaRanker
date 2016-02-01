# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

books = [
  {name: "Goodnight Moon", author: "Brittany", description: "A good book", ranking: 3},
  {name: "Harry Potter", author: "Brittany", description: "A nice book", ranking: 4},
  {name: "Curious George", author: "Brittany", description: "A cool book", ranking: 7},
]

books.each do |book|
  Book.create book
end

albums = [
  {name: "MMMBop", artist: "Brittany", description: "A good album", ranking: 1},
  {name: "This one", artist: "Brittany", description: "A nice album", ranking: 3},
  {name: "Another album", artist: "Brittany", description: "A cool album", ranking: 9},
]

albums.each do |album|
  Album.create album
end

movies = [
  {name: "It's a movie", director: "Brittany", description: "A good movie", ranking: 13},
  {name: "Another movie", director: "Brittany", description: "A nice movie", ranking: 0},
  {name: "Just a movie", director: "Brittany", description: "A cool movie", ranking: 1},
]

movies.each do |movie|
  Movie.create movie
end
