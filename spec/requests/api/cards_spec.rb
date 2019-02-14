require 'rails_helper'

RSpec.describe Api::CardsController, type: :request do
  describe 'GET /cards' do

    let!(:card) {5.times { create(:card) }}

    before do
      get '/api/cards'
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'should return all cards' do
      expect(JSON.parse(response.body)['cards'].count).to eq 5
    end
  end
end