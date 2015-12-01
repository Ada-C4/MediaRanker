movies = [
  {name: "Love and Basketball", director: "Mary", description: "basketball, love", rank: 0},
  {name: "Adie Achievements", director: "Annalee Herrera", description: "adies change the world", rank:0},
  {name: "Hunger Games", director: "Katniss Everdeen", description: "fight for your life", rank: 0},
  {name: "Lion King", director: "Simba Lion", description: "Just can't wait to be King", rank: 0}
]

movies.each do |movie|
  Movie.create(movie)
end



# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
