movies = [
  { title: "Lost Day", description: "A day got lost", ranking:10, director:"Stevie Smileberg"},
  { title: "War Horse", description: "A day got lost", ranking:10, director:"Stevie Smileberg"},
  { title: "The Happening", description: "Mark Walhberg is ridiculous", ranking:1, director:"Kevin Smith"},
  { title: "All Dogs go to Heaven", description: "Dogs in heaven", ranking:20, director:"Lulu L"},
  { title: "Hellraiser", description: "A man unleashes demons into a house, and it's more funny than scary.", ranking:11, director:"Wes Craven"},
  { title: "Little Miss Sunshine", description: "A sad and happy family goes on a trip together.", ranking:5, director:"Some director"},
  { title: "Groundhog Day", description: "Bill Murray in the performance of a lifetime.", ranking:30, director:"John Hughes"},
  { title: "The Lost World", description: "Dinosaurs come back to eat everyone once again. This time on a different island.", ranking:4, director:"Steven Smileberg"},
  { title: "Apocalypto", description: "A violent romp in an ancient civilization. Hold onto your heads!", ranking:3, director:"Mel Gibson"},
  { title: "Racing Stripes", description: "I think it has Bill Murray in it.", ranking:13, director:"A director person"},
  { title: "Lost in Translation", description: "Bill Murray and Scarjo have fun, and are kind of sad. They stay in a cool hotel.", ranking:16, director:"S. Coppola"},
  { title: "X Files: The movie", description: "A huge disappointment to x-files fans across the globe.", ranking:1, director:"Lameo Mclame"},
  { title: "Peter Pan", description: "A boy, a pirate, kids, a dog who is a Nanny, irresponsible parenting", ranking:6, director:"Peter P."}
]

movies.each do |movie|
  Movie.create(movie)
end


books = [
  { title: "To Kill a Mockingbird", description: "Noble people do noble things, crummy people do crummy things.", ranking:19, author:"H."},
  { title: "Bookie book", description: "A fantastic book", ranking:30, author:"Cheryl Strayd"},
  { title: "All the light we cannot see", description: "Little kids during a war do stuff.", ranking:8, author:"Writey Writer"},
  { title: "Euphoria", description: "Anthropologists in a love triangle", ranking:5, author:"Lily King"},
  { title: "A list of things that didn't kill me", description: "A man in Seattle has a rough childhood.", ranking:14, author:"Jason Schmidt"},
  { title: "Fun book", description: "It's a fun book", ranking:3, author:"Some author"},
  { title: "The Bible", description: "You can read about stuff that people care about a lot.", ranking:20, author:"It's complicated"},
  { title: "Booklet book", description: "A great description of a great book.", ranking:23, author:"Authory author"},
  { title: "Salt", description: "All about the history of salt, and much much more", ranking:9, author:"Salty Salt"},
  { title: "Paper book", description: "This is a dumb book", ranking:1, author:"An author"},
  { title: "Everybody poops", description: "Let's learn about how everybody poops! Big poops, small poops, all poops.", ranking:18, author:"M.S. Poop"},
  { title: "Scary Stories", description: "A book of chilling tales. Boo!", ranking:14, author:"R.L Stein"},
  { title: "The Berenstein Bears go to Camp", description: "The bears are at it again. Mischief and fun at camp!", ranking:10, author:"Jan Berenstein"}
]

books.each do |book|
  Book.create(book)
end

albums = [
  { title: "Pet Sounds", description: "The one by Brian Wilson that the world wasn't ready for but now people this is cool.", ranking:10, artist:"Brian Wilson"},
  { title: "Smile", description: "Brian Wilson made this one way late, in 2004, after coming back from the brink of madness", ranking:20, artist:"Brian Wilson"},
  { title: "Lost and Found", description: "Nice beats", ranking:17, artist:"Pretty Lights"},
  { title: "Music for the Holidays", description: "Another holiday album", ranking:0, artist:"Mariah Carey"},
  { title: "Music for the Morning After", description: "Emotional music.", ranking:5, artist:"Pete Yorn"},
  { title: "Song and songs", description: "Lots of great songs.", ranking:13, artist:"A brilliant artist"}
]

albums.each do |album|
  Album.create(album)
end
