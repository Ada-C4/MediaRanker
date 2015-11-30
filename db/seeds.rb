# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


seed_movies = [
  {name: "The Little Mermaid", director: "Albert Einstein", description: "A fish creature wants legs, watch the epic journey.", votes: 22},
  {name: "Generic Movie", director: "Daphne", description: "Very Generic", votes: 10},
  {name: "Pan's Labyrinth", director: "Guillermo del Toro", description: "", votes: 55}
]

seed_movies.each do |seed|
  Movie.create(seed)
end

seed_books = [
  {name: "The Name of the Wind", author: "Patrick Rothfuss", description: "", votes: 100},
  {name: "Generic Book", author: "Darkwing Daphne", description: "Very Generic", votes: 15},
]

seed_books.each do |seed|
  Book.create(seed)
end

seed_albums = [
  {name: "Spice", artist: "Spice Girls", description: "Awesomesweetrocktacular", votes: 25},
  {name: "Generic Album", artist: "Generic Artist", description: "Very Generic", votes: 10},
]

seed_albums.each do |seed|
  Album.create(seed)
end
