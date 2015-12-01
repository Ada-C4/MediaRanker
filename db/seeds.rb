# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


seed_movies = [
  {name:"Cats", director:"Mr. Cat", description:"A movie about cats", rank:2},
  {name:"Another Movie", director:"Hello", description:"Hi", rank:4},
  {name:"Dogs", director:"Mr.Dog", description:"Great Movie", rank:1}

]

seed_movies.each do |seed|
  Movie.create(seed)
end

seed_books = [
  {name:"Friends", author:"Emily", description:"A book about friends", rank:12},
  {name:"Another Book", author:"Emily", description:"Hi", rank:2},
  {name:"Cats and Dogs", author:"You", description:"Great Book", rank:1}

]

seed_books.each do |seed|
  Book.create(seed)
end

seed_albums = [
  {name:"Songs to Sing", artist:"Emily", description:"Good Songs", rank:2},
  {name:"Christmas Songs", artist:"Santa", description:"Songs for the Holiday", rank:23},
  {name:"Songs about Cats", artist:"You", description:"Happy Songs", rank:23}

]

seed_albums.each do |seed|
  Album.create(seed)
end
