# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


seed_media = [
  {name: "The Little Mermaid", creator: "Albert Einstein", description: "A fish creature wants legs, watch the epic journey.", votes: 22, kind: "movie"},
  {name: "Generic Movie", creator: "Daphne", description: "Very Generic", votes: 10, kind: "movie"},
  {name: "Pan's Labyrinth", creator: "Guillermo del Toro", description: "", votes: 55, kind: "movie"},
  {name: "The Name of the Wind", creator: "Patrick Rothfuss", description: "", votes: 100, kind: "book"},
  {name: "Generic Book", creator: "Darkwing Daphne", description: "Very Generic", votes: 15, kind: "book"},
  {name: "Spice", creator: "Spice Girls", description: "Awesomesweetrocktacular", votes: 25, kind: "album"},
  {name: "Generic Album", creator: "Generic Artist", description: "Very Generic", votes: 10, kind: "album"}
]

seed_media.each do |seed|
  Medium.create(seed)
end
