require 'shared_controller_spec'

RSpec.describe MoviesController, type: :controller do
  let(:item) { Movie.create(name: "The Little Mermaid", votes: 22) }
  let(:params) { { movie: { name: "Generic Name" } } }
  let(:bad_params) { { movie: { name: nil } } }

  include_examples(
    "media_controller",
    Movie
  )
end
