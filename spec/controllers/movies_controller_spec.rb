require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
	let(:create_params) do {
				movie: {
					name: "Some movie",
					description: "It's got music!",
					votes: 1
				}
			}
		end

	let(:media) { Movie.create(create_params[:movie]) }

	let(:medias) {Album.all}

	let(:bad_params) do
		{ 
			id: media.id,
			movie: {
				name: nil,
				description: 'this'
			}
		}
		end

	let(:update_params) do 
		{
			id: media.id,
			movie: {
				name: "Some Thing",
				description: "here's a new thing"
			}
		}
	end

	let(:model) {Movie}
	let(:medias) {"movies"}

	it_behaves_like "a media controller"

end