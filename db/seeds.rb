album = {
  type: "Album",
  objects: [
    {title: "Thriller",
    creator: "Michael Jackson"},
    {title: "Nevermind",
    creator: "Nirvana"},
    {title: "Abbey Road",
    creator: "The Beatles"},
    {title: "Kind of Blue",
    creator: "Miles Davis"},
    {title: "Blonde on Blonde",
    creator: "Bob Dylan"},
    {title: "Blue",
    creator: "Joni Mitchell"},
    {title: "What's Going On",
    creator: "Marvin Gay"},
    {title: "The Doors",
    creator: "The Doors"},
    {title: "Like a Virgin",
     creator: "Madonna"},
    {title: "Legend",
    creator: "Bob Marley and the Wailers"},
    {title: "My Life",
       creator: "Mary J. Blige"},
     ]
}

movie = {
  type: "Movie",
  objects: [
    {title: "The Shawshank Redemption",
     creator: "Frank Darabont",
     description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency."},
     {title: "The Godfather",
     creator: "Francis Ford Coppola",
     description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son."},
     {title: "The Dark Knight",
     creator: "Christopher Nolan",
     description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, the caped crusader must come to terms with one of the greatest psychological tests of his ability to fight injustice."},
     {title: "12 Angry Men",
     creator: "Sidney Lumet",
     description: "A dissenting juror in a murder trial slowly manages to convince the others that the case is not as obviously clear as it seemed in court."},
     {title: "Schindler's List",
     creator: "Steven Spielberg",
     description: "In Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis."},
     {title: "Pulp Fiction",
     creator: "Quentin Tarantino",
     description: "The lives of two mob hit men, a boxer, a gangster's wife, and a pair of diner bandits intertwine in four tales of violence and redemption."},
     {title: "The Good, the Bad, and the Ugly",
     creator: "Sergio Leone",
     description: "A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery."},
     {title: "The Lord of the Rings: Return of the King",
     creator: "Peter Jackson",
     description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring."},
     {title: "Fight Club",
     creator: "David Fincher",
     description: "An insomniac office worker, looking for a way to change his life, crosses paths with a devil-may-care soap maker, forming an underground fight club that evolves into something much, much more..."},
     {title: "Star Wars Episode V: The Empire Strikes Back",
     creator: "Irvin Kershner",
     description: "After the rebels have been brutally overpowered by the Empire on their newly established base, Luke Skywalker takes advanced Jedi training with Master Yoda, while his friends are pursued by Darth Vader as part of his plan to capture Luke."},
     {title: "Forrest Gump",
     creator: "Robert Zemeckis",
     description: "Forrest Gump, while not intelligent, has accidentally been present at many historic moments, but his true love, Jenny Curran, eludes him."},
     {title: "The Goonies",
     creator: "Richard Donner",
     description: "In order to save their home from foreclosure, a group of misfits set out to find a pirate's ancient treasure."},
   ]
 }

book = {
  type: "Book",
  objects: [
    {title: "Ulysses",
    creator: "James Joyce"},
    {title: "The Great Gatsby",
    creator: "F. Scott Fitzgerald"},
    {title: "Lolita",
    creator: "Vladimir Nabokov"},
    {title: "Brave New World",
    creator: "Aldous Huxley"},
    {title: "The Sound and the Fury",
    creator: "William Faulkner"},
    {title: "Bridget Jones's Diary",
    creator: "Helen Fielding"},
    {title: "Catch-22",
    creator: "Joseph Heller"},
    {title: "Invisible Man",
    creator: "Ralph Ellison"},
    {title: "Practical Object-Oriented Design in Ruby (POODR)",
     creator: "Sandi Metz"},
  ]
}
[album, movie, book].each do |medium_hash|
  type = medium_hash[:type]
  objects = medium_hash[:objects]
  objects.each do |object|
    new_obj = type.constantize.create(object)
    new_obj.upvotes = rand(1..50)
    new_obj.save
  end
end
