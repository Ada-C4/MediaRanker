require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:good_params) do
      {
        movie:{
          name: "Hello", director: "You", description: "A Good Movie", rank: 0
        }
      }
    end
    let(:bad_params) do
      {
      movie:{
       director: "You", description: "A Good Movie", rank: 0
      }
    }
    end
    let(:media_type) do
      :movie
    end
    let(:media_type_plural) do
      :movies
    end
    let(:test_medium) do
      Movie.create( name: "Hello", director: "You", description: "A Good Movie", rank: 0 )
    end
      let(:good_update_params) do
        {
          id: 1,
          movie:{
            name: "Hello", director: "You", description: "A Good Movie", rank: 0
          }
        }
      end

      let(:bad_update_params) do
        {
          id: 1,
          movie: { name: nil, director: "You", description: "A Good Movie", rank: 0 }
      }
      end
  end
end
