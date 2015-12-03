require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:model) do
      Book
    end
    let(:model_name) do
      "book"
    end
    let(:medium) do
      Book.create(name: "hello")
    end
    let(:good_params) do
      {
        id: 1,
        book: {
          name: "something something"
        }
      }
    end
    let(:bad_params) do
      {
        id: 1,
        book: {
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
        book: {
          name: "hello",
          ranking: 0
        }
      }
    end

    it "renders show view" do
      Book.create(params[:book])
      patch :upvote, params
      expect(response.status).to eq 200
      expect(subject).to render_template :show
    end
  end

end
