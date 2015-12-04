# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

albums = [{title: "Thriller",
          artist: "Michael Jackson"},
          {title: "Nevermind",
          artist: "Nirvana"},
          {title: "Abbey Road",
          artist: "The Beatles"},
          {title: "Kind of Blue",
          artist: "Miles Davis"},
          {title: "Blonde on Blonde",
          artist: "Bob Dylan"},
          {title: "Blue",
          artist: "Joni Mitchell"},
          {title: "What's Going On",
          artist: "Marvin Gay"},
          {title: "The Doors",
          artist: "The Doors"},
          {title: "Like a Virgin",
           artist: "Madonna"},
          {title: "Legend",
          artist: "Bob Marley and the Wailers"},
          {title: "My Life",
           artist: "Mary J. Blige"},
         ]

movies = [{title: "The Shawshank Redemption",
         director: "Frank Darabont",
         description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency."},
         {title: "The Godfather",
         director: "Francis Ford Coppola",
         description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son."},
         {title: "The Dark Knight",
         director: "Christopher Nolan",
         description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, the caped crusader must come to terms with one of the greatest psychological tests of his ability to fight injustice."},
         {title: "12 Angry Men",
         director: "Sidney Lumet",
         description: "A dissenting juror in a murder trial slowly manages to convince the others that the case is not as obviously clear as it seemed in court."},
         {title: "Schindler's List",
         director: "Steven Spielberg",
         description: "In Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis."},
         {title: "Pulp Fiction",
         director: "Quentin Tarantino",
         description: "The lives of two mob hit men, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption."},
         {title: "The Good, the Bad, and the Ugly",
         director: "Sergio Leone",
         description: "A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery."},
         {title: "The Lord of the Rings: Return of the King",
         director: "Peter Jackson",
         description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring."},
         {title: "Fight Club",
         director: "David Fincher",
         description: "An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more..."},
         {title: "Star Wars Episode V: The Empire Strikes Back",
         director: "Irvin Kershner",
         description: "After the rebels have been brutally overpowered by the Empire on their newly established base, Luke Skywalker takes advanced Jedi training with Master Yoda, while his friends are pursued by Darth Vader as part of his plan to capture Luke."},
         {title: "Forrest Gump",
         director: "Robert Zemeckis",
         description: "Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him."},
         {title: "The Goonies",
         director: "Richard Donner",
         description: "In order to save their home from foreclosure, a group of misfits set out to find a pirate's ancient treasure."},

        ]

books = [{title: "Ulysses",
          author: "James Joyce"},
          {title: "The Great Gatsby",
          author: "F. Scott Fitzgerald"},
          {title: "Lolita",
          author: "Vladimir Nabokov"},
          {title: "Brave New World",
          author: "Aldous Huxley"},
          {title: "The Sound and the Fury",
          author: "William Faulkner"},
          {title: "Bridget Jones's Diary",
          author: "Helen Fielding"},
          {title: "Catch-22",
          author: "Joseph Heller"},
          {title: "Invisible Man",
          author: "Ralph Ellison"},
          {title: "Practical Object-Oriented Design in Ruby (POODR)",
           author: "Sandi Metz"},
         ]

albums.each { |album| Album.create(album) }
movies.each { |movie| Movie.create(movie) }
books.each { |book| Book.create(book) }
