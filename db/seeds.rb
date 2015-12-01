# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

books = [
  {name: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", description:"Harry Potter and the Philosopher's Stone is the first novel in the Harry Potter series and J. K. Rowling's debut novel, first published in 1997 by Bloomsbury."},
  {name: "Diary", author: "Chuck Palahniuk"},
  {name: "The Wind-Up Bird Chronicle", author: "Haruki Murakami"},
  {name: "Aloha Zombies", author: "Desiree Poland", description: "A tropical zombie outbreak"},
  {name: "Another Book", author: "Desiree Poland", description: "This is a book."}
]

books.each do |book|
  Book.create book
end

movies = [
  {name: "28 Days Later", director: "Danny Boyle", description:"2002 British post-apocalyptic horror film"},
  {name: "Spirited Away", director: "Hayao Miyazaki", upvotes: 14},
  {name: "Aladdin", director: "Disney?", description: "Aladdin frees a genie from a lamp."},
  {name: "500 Days of Summer", director: "Marc Webb"},
  {name: "10 Things I Hate About You", director: "Gil Junger"},
  {name: "Another Movie", director: "Desiree Poland", description: "This is a great movie."}
]

movies.each do |movie|
  Movie.create movie
end

albums = [
  {name: "Souled Out", artist: "Jhene Aiko"},
  {name: "CrazySexyCool", artist: "TLC", description: "Don't go chasing waterfalls"},
  {name: "Beyoncé", artist: "Beyoncé", description: "Queen Bey"},
  {name: "The Writing's On The Wall", artist: "Destiny's Child", description: "Say my name"}
]

albums.each do |album|
  Album.create album
end
