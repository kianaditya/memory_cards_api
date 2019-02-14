require 'rails_helper'

RSpec.describe Api::V0::PingsController, type: :request do
  describe 'GET /cards' do
    it 'should return all cards' do
      get '/api/cards'

      json_response = JSON.parse(response.body)
      expect(response.status).to eq 200
      expect(json_response['message']).to eq 'Pong'
    end
  end
end