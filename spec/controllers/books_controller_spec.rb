require 'rails_helper'

RSpec.describe BooksController, type: :controller do

	let(:create_params) do {
				book: {
					name: "Some book",
					description: "It's got music!",
					votes: 1
				}
			}
		end

	let(:media) { Book.create(create_params[:book]) }

	let(:medias) {Book.all}

	let(:bad_params) do
		{ 
			id: media.id,
			book: {
				name: nil,
				description: 'this'
			}
		}
		end

	let(:update_params) do 
		{
			id: media.id,
			book: {
				name: "Some Thing",
				description: "here's a new thing"
			}
		}
	end

	let(:model) {Book}
	let(:medias) {"books"}

	it_behaves_like "a media controller"
end