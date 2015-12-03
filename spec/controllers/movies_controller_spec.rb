require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:model) do
      Movie
    end
    let(:model_name) do
      "movie"
    end
    let(:medium) do
      Movie.create(name: "hello")
    end
    let(:good_params) do
      {
        id: 1,
        movie: {
          name: "something something"
        }
      }
    end
    let(:bad_params) do
      {
        id: 1,
        movie: {
          name: nil,
          description: "something"
        }
      }
    end
  end

  describe "PATCH 'upvote'" do
    let(:params) do
      {
        id: 1,
        movie: {
          name: "hello",
          ranking: 0
        }
      }
    end

    it "renders show view" do
      Movie.create(params[:movie])
      patch :upvote, params
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end
  end
end
