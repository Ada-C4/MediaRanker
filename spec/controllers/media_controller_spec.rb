require 'shared_controller_spec'

RSpec.describe MediaController, type: :controller do
  let(:item) { Album.create(name: "The Little Mermaid", votes: 22) }
  let(:params) { { album: { name: "Generic Name" } } }
  let(:bad_params) { { album: { name: nil } } }

  it_behaves_like "controller", Album
end

RSpec.describe MediaController, type: :controller do
  let(:item) { Book.create(name: "The Little Mermaid", votes: 22) }
  let(:params) { { book: { name: "Generic Name" } } }
  let(:bad_params) { { book: { name: nil } } }

  it_behaves_like "controller", Book
end

RSpec.describe MediaController, type: :controller do
  let(:item) { Movie.create(name: "The Little Mermaid", votes: 22) }
  let(:params) { { movie: { name: "Generic Name" } } }
  let(:bad_params) { { movie: { name: nil } } }

  it_behaves_like "controller", Movie
end
