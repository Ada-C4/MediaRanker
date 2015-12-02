require 'shared_controller_spec'

RSpec.describe MoviesController, type: :controller do
  include_examples(
    "media_controller",
    Movie.create(name: "The Little Mermaid", votes: 22),
    { movie: { name: "Generic Name" } },
    { movie: { name: nil } },
    "/movies"
  )
end
