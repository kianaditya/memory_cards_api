require 'rails_helper'

RSpec.describe Api::CardsController, type: :request do
  describe 'GET /cards' do

    before do
      5.times { create(:card) }
    end

    it 'should return all cards' do
      get '/api/cards'
      json_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(json_response['cards'].count).to eq 5
    end
  end
end