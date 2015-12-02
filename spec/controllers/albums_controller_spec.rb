require 'shared_controller_spec'

RSpec.describe AlbumsController, type: :controller do
  let(:item) { Album.create(name: "The Little Mermaid", votes: 22) }
  let(:params) { { album: { name: "Generic Name" } } }
  let(:bad_params) { { album: { name: nil } } }

  include_examples(
    "media_controller",
    Album
  )
end
