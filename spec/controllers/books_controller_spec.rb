require 'shared_controller_spec'

RSpec.describe BooksController, type: :controller do
  include_examples "media_controller", Book.create(name: "The Little Mermaid", votes: 22), { book: { name: "Generic Name" } }, { book: { name: nil } }, "/books"
end
