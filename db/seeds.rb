movies = [
  {name: "Love and Basketball", director: "Mary", description: "basketball, love", rank: 0},
  {name: "Adie Achievements", director: "Annalee Herrera", description: "adies change the world", rank:0},
  {name: "Hunger Games", director: "Katniss Everdeen", description: "fight for your life", rank: 0},
  {name: "Lion King", director: "Simba Lion", description: "Just can't wait to be King", rank: 0}
]

movies.each do |movie|
  Movie.create(movie)
end

books = [
  {name: "Love", author: "Cupid", description: "love is cool", rank: 0},
  {name: "Adie", author: "Annalee Herrera", description: "adies yaaah!", rank:0},
  {name: "Hunger", author: "Peeta", description: "he wins", rank: 0},
  {name: "Lion", author: "Nala", description: "Nala + Simba 4Eva", rank: 0}
]

books.each do |book|
  Book.create(book)
end


albums = [
  {name: "Cupid", artist: "112", description: "Doesn't lie", rank: 0},
  {name: "Adie's Night", artist: "Annalee Herrera", description: "this is adie's night", rank:0},
  {name: "Quit Playing Games With My Heart", author: "N'Sync", description: "I should have known", rank: 0},
  {name: "Why you always Lion", artist: "Scar", description: "You're a cheetah.", rank: 0}
]

albums.each do |album|
  Album.create(album)
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
