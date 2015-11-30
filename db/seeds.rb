seed_movies = [
  {name: "Rocky", director: "John G. Avildsen", description: "Creed beats Balboa", rank: 0},
  {name: "Rocky II", director: "Sylvester Stallone", description: "Balboa beats Creed", rank: 0},
  {name: "Rocky III", director: "Sylvester Stallone", description: "Balboa beats Lang", rank: 0},
  {name: "Rocky IV", director: "Sylvester Stallone", description: "Balboa beats Drago", rank: 0},
  {name: "Rocky V", director: "John G. Avildsen", description: "Balboa beats Gunn", rank: 0}
]
seed_movies.each do |seed|
  Movie.create(seed)
end


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
