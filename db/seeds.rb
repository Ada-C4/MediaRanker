seed_movies = [
  { name: "Rocky", director: "John G. Avildsen", description: "Creed beats Balboa", rank: 0 },
  { name: "Rocky II", director: "Sylvester Stallone", description: "Balboa beats Creed", rank: 0 },
  { name: "Rocky III", director: "Sylvester Stallone", description: "Balboa beats Lang", rank: 0 },
  { name: "Rocky IV", director: "Sylvester Stallone", description: "Balboa beats Drago", rank: 0 },
  { name: "Rocky V", director: "John G. Avildsen", description: "Balboa beats Gunn", rank: 0 }
]
seed_movies.each do |seed|
  Movie.create(seed)
end

seed_books = [
  { name: "Les Miserables", author: "Victor Hugo", description: "Desperation and redemption", rank: 0 },
  { name: "Toilers of the Sea", author: "Victor Hugo", description: "Man vs. octopus", rank: 0 },
  { name: "The Hunchback of Notre Dame", author: "Victor Hugo", description: "Quasimodo, the hopeless romantic", rank: 0 },
  { name: "The Man Who Laughs", author: "Victor Hugo", description: "Gwynplaine, the hopeless romantic", rank: 0 }
]
seed_books.each do |seed|
  Book.create(seed)
end

seed_albums = [
  { name: "Blue", artist: "Joni Mitchell", description: "Moody Acoustic Awesomeness", rank: 0 },
  { name: "Clouds", artist: "Joni Mitchell", description: "Beautiful, lilting vocals", rank: 0 },
  { name: "Mingus", artist: "Joni Mitchell", description: "Jazzy", rank: 0 },
  { name: "Both Sides Now", artist: "Joni Mitchell", description: "Classic", rank: 0 }
]
seed_albums.each do |seed|
  Album.create(seed)
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
