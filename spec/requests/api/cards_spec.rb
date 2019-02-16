require 'rails_helper'

RSpec.describe Api::CardsController, type: :request do
  
  let(:user) { create(:user, email: 'user@mail.com') }
  let(:credentials) { user.create_new_auth_token }
  let(:headers) { { HTTP_ACCEPT: 'application/json' } .merge!(credentials) }
  
  context 'GET /cards' do

    let!(:card) {5.times { create(:card,user: user) }}

    before do
      get '/api/cards', headers: headers
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'should return all cards' do
      expect(JSON.parse(response.body)['cards'].count).to eq 5
    end
  end

  context 'detailed spec to test associations etc' do
    let(:category) { create(:category, name: 'Ruby') }
    let!(:card) { create(:card, question:"What's in name?",answer: "n,a,m,e",category: category, user: user) }

    before do
      get '/api/cards', headers: headers
    end

    it 'includes info about user' do
      expected_email = JSON.parse(response.body)['cards'][0]['user']['email']
      expect(expected_email).to eq 'user@mail.com' 
    end

    it 'includes info about question' do
      expected_question = JSON.parse(response.body)['cards'][0]['question']
      expect(expected_question).to eq "What's in name?" 
    end

    it 'includes info about category' do
      expected_category = JSON.parse(response.body)['cards'][0]['category']['name']
      expect(expected_category).to eq 'Ruby' 
    end
  end

  context 'Create Card' do 
    let(:category) { create(:category, name: 'Ruby') }
    let (:valid_params) do
      { question: "Hello World", answer: "Hello to you as well!", category_id: category.id, user_id: user.id }
    end

    before do
      post '/api/cards', headers: headers, params: valid_params
    end
    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'should return all cards' do
      expect(JSON.parse(response.body)['cards'].count).to eq 1
    end

    it 'includes info about user' do
      expected_email = JSON.parse(response.body)['cards'][0]['user']['email']
      expect(expected_email).to eq 'user@mail.com' 
    end

    it 'includes info about question' do
      expected_question = JSON.parse(response.body)['cards'][0]['question']
      expect(expected_question).to eq "Hello World" 
    end

    it 'includes info about category' do
      expected_category = JSON.parse(response.body)['cards'][0]['category']['name']
      expect(expected_category).to eq 'Ruby' 
    end

  end

  context 'Update Cards' do
    let(:category) { create(:category, name: 'Ruby') }
    let!(:card) { create(:card,id: 1, question:"What's in name?",answer: "n,a,m,e",category: category, user: user) }
    let (:valid_params) do
      { id: 1, question: "Hello World" }
    end

    before do 
      patch '/api/cards/1', headers: headers, params: valid_params
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'includes info about question' do
      expected_question = JSON.parse(response.body)['cards'][0]['question']
      expect(expected_question).to eq "Hello World" 
    end

  end

  context 'Delete /cards' do
    let(:category) { create(:category, name: 'Ruby') }
    let!(:card) { create(:card,id: 1, question:"What's in name?",answer: "n,a,m,e",category: category, user: user) }

    before do 
      delete '/api/cards/1', headers: headers
    end

    it 'returns 200' do
      expect(response).to have_http_status(200)
    end

    it 'should not return any cards' do
      expect(JSON.parse(response.body)['cards'].count).to eq 0
    end

  end
end