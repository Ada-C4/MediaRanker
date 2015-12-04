# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


sample_movies = [
  {name: "Lars and the Real Girl", director: "Craig Gillespie", description: "Lars, a sweet yet quirky, socially inept young man, develops a romantic yet platonic relationship with an anatomically correct sex doll.", votes: 0},
  {name: "Kill Bill", director: "Quentin Tarantino", description: "A character initially identified as 'The Bride,' a former assassin seeking revenge on her ex-colleagues who massacred members of her wedding party and tried to kill her.", votes: 0},
  {name: "The History of Future Folk", director: "John Mitchell", description: "The origin story of the real life alien bluegrass band, Future Folk", votes: 0}
]

sample_books = [
  {name: "A Mango Shaped Space", author: "Wendy Mass", description: "A thirteen-year-old girl living with synesthesia, a jumbling of the senses", votes: 0},
  {name: "Where the Red Fern Grows", author: "Wilson Rawls", description: "A boy who buys and trains two Redbone Coonhound hunting dogs", votes: 0},
  {name: "Ender's Game", author: "Orson Scott Card", description: "In preparation for an anticipated third invasion, children are trained from a very young age through increasingly difficult games", votes: 0}
]

sample_albums =[
  {name: "The Suburbs", artist: "Arcade Fire", description: "The greatest album ever made", votes: 0},
  {name: "The Con", artist: "Tegan and Sara", description: "Another great album", votes: 0},
  {name: "Purpose", artist: "Justin Bieber", description: "Guilty pleasure", votes: 0}
]

sample_movies.each do |movie|
  Movie.create(movie)
end

sample_books.each do |book|
  Book.create(book)
end

sample_albums.each do |album|
  Album.create(album)
end
