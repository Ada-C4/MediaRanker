# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# BOOKS

Book.create(title: "Harry Potter and the Sorcer's Stone", author: "J.K.Rowling", description: "That time when Harry found out he was the boy who lived", rank: 10)

Book.create(title: "Harry Potter and the Chamber of Secrets", author: "J.K.Rowling", description: "That time when that Harry saved his future wife from a giant snake", rank: 10)

Book.create(title: "Harry Potter and the Prisoner of Azkaban", author: "J.K.Rowling", description: "That time when that Harry found out his godfather was a convict", rank: 10)

Book.create(title: "Harry Potter and the Goblet of Fire", author: "J.K.Rowling", description: "That time when Harry battled Voldemort after he came back and killed Cederic Diggory", rank: 10)

Book.create(title: "Harry Potter and the Order of the Phoenix", author: "J.K.Rowling", description: "The time when an evil wizzard causes Harry pain and physical scars, not Voldemort, but Umbridge!", rank: 10)

Book.create(title: "Harry Potter and the Half-Blood Prince", author: "J.K.Rowling", description: "That time when Dumbledore and Harry look for Horcuxes", rank: 10)

Book.create(title: "Harry Potter and the Deadly Hallows", author: "J.K.Rowling", description: "That time when Harry dies and Nevil saves everyone", rank: 10)

# ALBUMS

Album.create(title: "Billie Holiday Sings", artist: "Billie Holiday", description: "Recorded: March 26, 1952", rank: 10)

Album.create(title: "An Evening with Billie Holiday", artist: "Billie Holiday", description: "Recorded: April 1, 1952 & July 27, 1952", rank: 10)

Album.create(title: "Billie Holiday", artist: "Billie Holiday", description: "Recorded: April 1, 1952 & April 14, 1954", rank: 10)

Album.create(title: "Stay with Me", artist: "Billie Holiday", description: "Recorded: August 23 & August 25, 1955", rank: 10)

Album.create(title: "Music for Torching", artist: "Billie Holiday", description: "Recorded: August 23 & August 25, 1955", rank: 10)

Album.create(title: "Velvet Mood", artist: "Billie Holiday", description: "Recorded: August 23 & August 25, 1955", rank: 10)

Album.create(title: "Lady Sings the Blues", artist: "Billie Holiday", description: "Lady Sings the Blues
Recorded: June 6 & 7, 1956, September 3, 1954", rank: 10)

Album.create(title: "Body and Soul", artist: "Billie Holiday", description: "Recorded: January 3, 4, 7, & 9, 1957", rank: 10)

Album.create(title: "Songs for Distingué Lovers", artist: "Billie Holiday", description: "Recorded: January 3, 4, 7, & 8, 1957", rank: 10)

Album.create(title: "All or Nothing at All", artist: "Billie Holiday", description: "Recorded: August 14 & 18, 1956, January 3, 7, & 8, 1957", rank: 10)

Album.create(title: "The Unforgettable Lady Day", artist: "Billie Holiday", description: "Recording dates unknown", rank: 10)

Album.create(title: "Lady in Satin", artist: "Billie Holiday", description: "Recorded: February 19, 20, & 21, 1958", rank: 10)

Album.create(title: "Last Recordings", artist: "Billie Holiday", description: "Recorded: March 3, 4, & 11, 1959", rank: 10)

#MOVIES

Movie.create(title: "Alien", director: "Ridley Scott", description: "Sigourney Weaver is a badass", rank: 10)

Movie.create(title: "Aliens", director: "James Cameorn", description: "Sigourney Weaver continues to be a badass", rank: 10)

Movie.create(title: "Alien 3", director: "David Fincher", description: "Sigourney Weaver remains a badass", rank: 10)

Movie.create(title: "Alien: Resurrection", director: "Jean-Pierre Jenunet", description: "Sigourney Weaver cements her place in history as a badass", rank: 10)
