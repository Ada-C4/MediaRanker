require 'shared_controller_spec'

RSpec.describe MoviesController, type: :controller do
  let(:item) { Medium.create(name: "The Little Mermaid", votes: 22, kind: "movie") }
  let(:params) { { medium: { name: "Generic Name" } } }
  let(:bad_params) { { medium: { name: nil } } }

  include_examples(
    "media_controller",
    Medium,
    :movie
  )
end
