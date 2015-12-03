# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_movie = [
  {name: "the wife of the time traveler", director: "booRobert Schwentkebli", description: "A romantic drama about a Chicago librarian with a gene that causes him to involuntarily time travel, and the complications it creates for his marriage.", rank: 4},
  {name: "movie2", director: "32", description: "actor", rank: 5},
  {name: "movie3", director: "dddd", description: "actor", rank: 3}
]

seed_movie.each do |movie|
  Movie.create(movie)
end

seed_book = [
  {name: "the wife of the time traveler", author: "Audrey Niffenegger", description: "accountant", rank: 2},
  {name: "book2", author: "bosaobli", description: "actor", rank: 6},
  {name: "book3", author: "bosobli", description: "actor", rank: 10}
]
seed_book.each do |book|
  Book.create(book)
end

seed_album = [
  {name: "album1", artist: "booXXbli", description: "accountant", rank: 5},
  {name: "album2", artist: "S", description: "actor", rank: 4},
  {name: "album4", artist: "boobli", description: "actor", rank: 3}
]

seed_album.each do |album|
  Album.create(album)
end
