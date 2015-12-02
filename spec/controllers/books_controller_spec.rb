require 'shared_controller_spec'

RSpec.describe BooksController, type: :controller do
  let(:item) { Medium.create(name: "The Little Mermaid", votes: 22, kind: "book") }
  let(:params) { { medium: { name: "Generic Name", kind: "book" } } }
  let(:bad_params) { { medium: { name: nil } } }

  include_examples(
    "media_controller",
    Medium,
    :book
  )
end
