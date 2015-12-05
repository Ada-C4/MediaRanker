# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
seed_movie = [
  {name: "the wife of the time traveler", director: "booRobert Schwentkebli", description: "A romantic drama about a Chicago librarian with a gene that causes him to involuntarily time travel, and the complications it creates for his marriage.", rank: 4},
  {name: "great movie1", director: "Emily", description: "actor", rank: 5},
  {name: "Great Movie2", director: "Rona", description: "amazing", rank: 3},
  {name: "Great Movie3", director: "Rona", description: "wow", rank: 3},
  {name: "Great Movie4", director: "Rona", description: "can't say enough good things", rank: 3},
  {name: "Great Movie5", director: "Rona", description: "actor", rank: 3},
  {name: "Great Movie6", director: "Rona", description: "actor", rank: 3},
  {name: "Great Movie27", director: "Rona", description: "actor", rank: 3},
  {name: "Great Movie9", director: "Rona", description: "actor", rank: 3},
  {name: "Great Movie11", director: "Rona", description: "actor", rank: 3},
  {name: "Great Movie12", director: "Rona", description: "actor", rank: 3},
  {name: "Great Movie13", director: "Rona", description: "actor", rank: 3},
  {name: "Great Movie14", director: "Rona", description: "actor", rank: 3},
  {name: "Great Movie15", director: "Rona", description: "actor", rank: 3},
  {name: "Great Movie16", director: "Rona", description: "actor", rank: 3},

]

seed_movie.each do |movie|
  Movie.create(movie)
end

seed_book = [
  {name: "the wife of the time traveler", author: "Audrey Niffenegger", description: "accountant", rank: 2},
  {name: "book2", author: "bosaobli", description: "actor", rank: 6},
  {name: "book3", author: "emily", description: "actor", rank: 10},
  {name: "book4", author: "bosobli", description: "actor", rank: 10},
  {name: "book5", author: "bosobli", description: "actor", rank: 10},
  {name: "book3", author: "Emily", description: "actor", rank: 10},
  {name: "book6", author: "Emily", description: "actor", rank: 10},
  {name: "book7", author: "Emily", description: "actor", rank: 10},
  {name: "book9", author: "Emily", description: "actor", rank: 10},
  {name: "book310", author: "Emily", description: "actor", rank: 10},
  {name: "book1", author: "Emily", description: "actor", rank: 10},
  {name: "book33", author: "Emily", description: "actor", rank: 10},
  {name: "book66", author: "Emily", description: "actor", rank: 10},
  {name: "book55", author: "Emily", description: "actor", rank: 10},
  {name: "book66", author: "Emily", description: "actor", rank: 10},
  {name: "book67", author: "Emily", description: "actor", rank: 10},
  {name: "book4", author: "Emily", description: "actor", rank: 10},


]
seed_book.each do |book|
  Book.create(book)
end

seed_album = [
  {name: "album1", artist: "booXXbli", description: "accountant", rank: 5},
  {name: "album2", artist: "S", description: "actor", rank: 4},
  {name: "album6", artist: "Guy", description: "actor", rank: 0},
  {name: "album8", artist: "Guy", description: "actor", rank: 0},
  {name: "album9", artist: "Guy", description: "actor", rank: 0},
  {name: "album33", artist: "Guy", description: "actor", rank: 0},
  {name: "album23", artist: "Guy", description: "actor", rank: 0},
  {name: "album43", artist: "Guy", description: "actor", rank: 0},
  {name: "album34", artist: "Guy", description: "actor", rank: 0},
  {name: "album78", artist: "Guy", description: "actor", rank: 0},
  {name: "album66", artist: "Guy", description: "actor", rank: 0},
  {name: "album445", artist: "Guy", description: "actor", rank: 0},
  {name: "album434", artist: "Guy", description: "actor", rank: 0},
  {name: "album45", artist: "Guy", description: "actor", rank: 0},
  {name: "album56", artist: "Guy", description: "actor", rank: 0},
  {name: "album78", artist: "Guy", description: "actor", rank: 0},
  {name: "album45", artist: "Guy", description: "actor", rank: 0},
  {name: "album4", artist: "Guy", description: "actor", rank: 0},
  {name: "album5", artist: "Guy", description: "actor", rank: 0},
  {name: "album4", artist: "Guy", description: "actor", rank: 0},
  {name: "album4", artist: "Guy", description: "actor", rank: 0},
  {name: "album4", artist: "Guy", description: "actor", rank: 0},
  {name: "album4", artist: "Guy", description: "actor", rank: 0},
  {name: "album4", artist: "Guy", description: "actor", rank: 0},
]

seed_album.each do |album|
  Album.create(album)
end
