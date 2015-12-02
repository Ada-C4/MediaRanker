require 'shared_controller_spec'

RSpec.describe AlbumsController, type: :controller do
  include_examples "media_controller", Album.create(name: "The Little Mermaid", votes: 22), { album: { name: "Generic Name" } }, { album: { name: nil } }, "/albums"
end
