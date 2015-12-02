require 'shared_controller_spec'

RSpec.describe AlbumsController, type: :controller do
  let(:item) { Medium.create(name: "The Little Mermaid", votes: 22, kind: "album") }
  let(:params) { { medium: { name: "Generic Name", kind: "album" } } }
  let(:bad_params) { { medium: { name: nil } } }

  include_examples(
    "media_controller",
    Medium,
    :album
  )
end
