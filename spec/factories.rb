FactoryGirl.define do
  factory :album do
    name "Test"
    description "Album's description"
    artist "Album's artist"
  end

  factory :book do
    name "Test"
    description "Book's description"
    author "Book's author"
  end

  factory :movie do
    name "Test"
    description "Movie's description"
    director "Movie's director"
  end
end
