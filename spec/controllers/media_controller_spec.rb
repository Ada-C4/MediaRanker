require 'rails_helper'

RSpec.describe MediaController, type: :controller do

  it_behaves_like "a controller", Album do
    let(:item) { create(:album) }
    let(:params) { { album: { name: "Generic Name" } } }
    let(:bad_params) { { album: { name: nil } } }
  end

  it_behaves_like "a controller", Book do
    let(:item) { create(:book) }
    let(:params) { { book: { name: "Generic Name" } } }
    let(:bad_params) { { book: { name: nil } } }
  end

  it_behaves_like "a controller", Movie do
    let(:item) { create(:movie) }
    let(:params) { { movie: { name: "Generic Name" } } }
    let(:bad_params) { { movie: { name: nil } } }
  end
end
