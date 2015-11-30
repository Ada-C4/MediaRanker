# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

movies = [
  { name: "Hackers", director: "who knows", description: "best 90s outfits", ranking: 0 },
  { name: "LotR", director: "Peter Jackson", description: "epic. and long.", ranking: 0 },
  { name: "Fern Gully", director: "donno", description: "environmentalist", ranking: 0 },
]

movies.each do |movie|
  Movie.create movie
end

books = [
  { name: "Parable of the Sower", author: "Octavia Butler", description: "dystopia visionary fiction", ranking: 0 },
  { name: "Mists of Avalon", author: "don't remember", description: "epically long", ranking: 0 },
  { name: "Some of the Kinder Planets", author: "many", description: "children's book", ranking: 0 },
]

books.each do |book|
  Book.create book
end

albums = [
  { name: "BodyTalk", artist: "MEN", description: "dance music", ranking: 0 },
  { name: "Wildewoman", artist: "Lucius", description: "friend times", ranking: 0 },
  { name: "The ArchAndroid", artist: "Janelle Monae", description: "more dancing", ranking: 0 },
]

albums.each do |album|
  Album.create album
end
