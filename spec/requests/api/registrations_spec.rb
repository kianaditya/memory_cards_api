require 'rails_helper'

RSpec.describe 'User Registration', type: :request do
    let(:headers) { { HTTP_ACCEPT: 'application/json' } }

    context 'with valid credentials' do

        before do
            post '/api/auth', params: {email: 'me@mail.com',
                password: 'whatever',
                password_confirmation: 'whatever',
                first_name: 'John',
                last_name: 'Doe',
                }, headers: headers
        end

        it 'returns 200' do
            expect(response).to have_http_status(200)
        end

        it 'returns a user and token' do
            expect(json_response(response.body)['status']).to eq 'success'
        end
    end

    context 'returns an error message when passwords mismatch' do

        before do
            post '/api/auth', params: {email: 'me@mail.com',
                password: 'whatever',
                password_confirmation: 'Whatever',
                first_name: 'John',
                last_name: 'Doe',
            }, headers: headers
        end

        it 'returns 422' do
            expect(response).to have_http_status(422)
        end

        it 'non-matching password confirmation' do
            expect(json_response(response.body)['errors']['password_confirmation']).to eq ["doesn't match Password"]
        end
    end 
    context 'returns an error message when invalid email' do
        before do
            post '/api/auth', params: {email: 'me@mail',
                password: 'whatever',
                password_confirmation: 'whatever',
                first_name: 'John',
                last_name: 'Doe',
                }, headers: headers
        end

        it 'returns 422' do
            expect(response).to have_http_status(422)
        end

        it 'an invalid email address' do
            expect(json_response(response.body)['errors']['email']).to eq ['is not an email']
        end
    end
    context 'returns an error message when email already taken' do
        before do
            create(:user, email: 'me@mail.com',
                password: 'whatever',
                password_confirmation: 'whatever')

            post '/api/auth', params: {email: 'me@mail.com',
                            password: 'whatever',
                            password_confirmation: 'whatever',
                            first_name: 'John',
                            last_name: 'Doe',
                        }, headers: headers
        end

        it 'returns 422' do
            expect(response).to have_http_status(422)
        end

        it 'an already registered email' do
            expect(json_response(response.body)['errors']['email']).to eq ['has already been taken']
        end
    end
end