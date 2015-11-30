movies = [
	{name: 'Harold and Maude', description: 'The best', director: 'No idea'}, 
	{name: 'A movie', description: "it's cool", director: "mr. cool guy" }, 
	{name: "another movie", description: "fdsf", director: "fdsfds"}, 
	{name: "the never ending story" , description: "atreyu", director: "who knows"}, 
	{name: "spice world", description: "the only movie you need", director: "probably a white dude"}, 
]

books = [
	{name: "vile bodies", author: "evelyn waugh", description: "this is something about a book"}, 
	{name: "war and peace", author: "tolstoy", description: "this is something about a book"}, 
	{name: "clifford the big red dog" , author: "dunno", description: "this is something about a book"}, 
	{name: "the dictionary", author: "everyone", description: "all teh wordz"}, 
	{name: "A book", author: "probably a dude", description: "this is something about a book"}, 
]

albums = [
	{name: "Eminem Show", artist: "Eminem", description: "middle school anthems" }, 
	{name: "Some Music", artist:"Some Artist", description: "This is a thing about music"}, 
	{name: "musica", artist: "artista", description: "i know i'm missing pronouns"}, 
	{name: "jdslkfksd", artist: "artist formerly known as prince", description: "a thing"}, 
	{name:"now 1", artist: "everyone", description: "now THAT'S what I call music"}, 
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