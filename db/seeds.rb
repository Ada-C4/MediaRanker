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
