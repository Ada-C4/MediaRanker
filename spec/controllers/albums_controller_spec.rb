require 'rails_helper'

RSpec.describe AlbumsController, type: :controller do
	let(:create_params) do {
				album: {
					name: "Some Album",
					description: "It's got music!",
					votes: 1
				}
			}
		end

	let(:bad_params) do
		{ 
			id: media.id,
			album: {
				name: nil,
				description: 'this'
			}
		}
		end

	let(:update_params) do 
		{
			id: media.id,
			album: {
				name: "Some Thing",
				description: "here's a new thing"
			}
		}
	end

	let(:media) { Album.create(create_params[:album]) }

	let(:medias) {"albums"}

	let(:model) {Album}

	it_behaves_like "a media controller"

end