# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


seed_media = [
  {name: "The Little Mermaid", creator: "Albert Einstein", description: "A fish creature wants legs, watch the epic journey.", votes: 22, type: "Movie"},
  {name: "Generic Movie", creator: "Daphne", description: "Very Generic", votes: 10, type: "Movie"},
  {name: "Pan's Labyrinth", creator: "Guillermo del Toro", description: "", votes: 55, type: "Movie"},
  {name: "The Name of the Wind", creator: "Patrick Rothfuss", description: "", votes: 100, type: "Book"},
  {name: "Generic Book", creator: "Darkwing Daphne", description: "Very Generic", votes: 15, type: "Book"},
  {name: "Spice", creator: "Spice Girls", description: "Awesomesweetrocktacular", votes: 25, type: "Album"},
  {name: "Generic Album", creator: "Generic Artist", description: "Very Generic", votes: 10, type: "Album"}
]

seed_media.each do |seed|
  Medium.create(seed)
end
