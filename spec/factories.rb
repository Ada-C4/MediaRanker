FactoryGirl.define do
  factory :book1, class: Book do
    name "Something"
    author "Someone"
    description "Something something something"
  end

  factory :book2, class: Book do
    name "Something"
    author "Someone"
    description "Something something something"
    ranking 3
  end

  factory :album1, class: Album do
    name "Something"
    artist "Someone"
    description "Something something something"
  end

  factory :album2, class: Album do
    name "Something"
    artist "Someone"
    description "Something something something"
    ranking 3
  end

  factory :movie1, class: Movie do
    name "Something"
    director "Someone"
    description "Something something something"
  end

  factory :movie2, class: Movie do
    name "Something"
    director "Someone"
    description "Something something something"
    ranking 3
  end
end
