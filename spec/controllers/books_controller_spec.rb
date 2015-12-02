require 'shared_controller_spec'

RSpec.describe BooksController, type: :controller do
  let(:item) { Book.create(name: "The Little Mermaid", votes: 22) }
  let(:params) { { book: { name: "Generic Name" } } }
  let(:bad_params) { { book: { name: nil } } }

  include_examples(
    "media_controller",
    Book
  )
end
