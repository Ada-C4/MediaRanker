require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  it_behaves_like "a medium controller"
  let(:model){Book}
end
