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

	let(:media) { Album.create(create_params[:album]) }

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

	it_behaves_like "a media controller"

end