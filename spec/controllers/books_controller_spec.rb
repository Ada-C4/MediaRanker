require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium controller" do
    let(:good_params) do
      {
        book:{
          name: "A Book", author: "You", description: "A Good Book", rank: 0
        }
      }
    end
    let(:bad_params) do
      {
      book:{
       author: "You", description: "A Good Book", rank: 0
      }
    }
    end
    let(:media_type) do
      :book
    end
    let(:media_type_plural) do
      :books
    end
    let(:test_medium) do
      Book.create( name: "A Book", author: "You", description: "A Good Book", rank: 0 )
    end
      let(:good_update_params) do
        {
          id: 1,
          book:{
            name: "A Book", author: "You", description: "A Good Book", rank: 0
          }
        }
      end

      let(:bad_update_params) do
        {
          id: 1,
          movie: { name: nil, author: "You", description: "A Good Book", rank: 0 }
      }
      end
  end
end
