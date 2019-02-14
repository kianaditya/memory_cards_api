require 'rails_helper'

RSpec.describe Api::CardsController, type: :request do
  context 'GET /cards' do

    let!(:card) {5.times { create(:card) }}

    before do
      get '/api/cards'
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'should return all cards' do
      expect(JSON.parse(response.body).count).to eq 5
    end
  end

  context 'detailed spec to test associations etc' do
    let(:user) { create(:user, email: 'user@mail.com') }
    let(:category) { create(:category, name: 'Ruby') }
    let!(:card) { create(:card, question:"What's in name?",answer: "n,a,m,e",category: category, user: user) }

    before do
      get '/api/cards'
    end

    it 'includes info about user' do
      expected_email = JSON.parse(response.body)[0]['user']['email']
      expect(expected_email).to eq 'user@mail.com' 
    end

    it 'includes info about question' do
      expected_question = JSON.parse(response.body)[0]['question']
      expect(expected_question).to eq "What's in name?" 
    end

    it 'includes info about category' do
      expected_category = JSON.parse(response.body)[0]['category']['name']
      expect(expected_category).to eq 'Ruby' 
    end
  end
end