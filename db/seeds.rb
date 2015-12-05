movies = [
	{name: 'Harold and Maude', description: 'The best', director: 'No idea', votes: 2}, 
	{name: 'A movie', description: "it's cool", director: "mr. cool guy", votes: 4}, 
	{name: "another movie", description: "fdsf", director: "fdsfds", votes: 3}, 
	{name: "the never ending story" , description: "atreyu", director: "who knows", votes: 2}, 
	{name: "spice world", description: "the only movie you need", director: "probably a white dude", votes: 1}, 
]

books = [
	{name: "vile bodies", author: "evelyn waugh", description: "this is something about a book", votes:3}, 
	{name: "war and peace", author: "tolstoy", description: "this is something about a book", votes: 4}, 
	{name: "clifford the big red dog" , author: "dunno", description: "this is something about a book", votes: 6}, 
	{name: "the dictionary", author: "everyone", description: "all teh wordz", votes: 0}, 
	{name: "A book", author: "probably a dude", description: "this is something about a book", votes: 2}, 
]

albums = [
	{name: "Eminem Show", artist: "Eminem", description: "middle school anthems", votes: 0 }, 
	{name: "Some Music", artist:"Some Artist", description: "This is a thing about music", votes: 2}, 
	{name: "musica", artist: "artista", description: "i know i'm missing pronouns", votes: 3}, 
	{name: "jdslkfksd", artist: "artist formerly known as prince", description: "a thing", votes: 5}, 
	{name:"now 1", artist: "everyone", description: "now THAT'S what I call music", votes: 8}, 
]



movies.each do |movie|
	Movie.create(movie)
end

albums.each do |album|
	Album.create(album)
end

books.each do |book|
	Book.create(book)
end