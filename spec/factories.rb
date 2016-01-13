FactoryGirl.define do
  # book = Book.new({name: "Les Miserables"})
  # movie = Movie.new({name: "Creed"})
  # album = Album.new({name: "Chair and Microphone"})
  factory :factory_book, class: Book do
    name "Les Miserables"
    rank 0
  end

  factory :factory_movie, class: Movie do
    name "Creed"
    rank 0
  end

  factory :factory_album, class: Album do
    name "Chair and Microphone"
    rank 0
  end
end
