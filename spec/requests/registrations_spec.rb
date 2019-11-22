require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let(:url) { '/signup' }
  let(:params) do 
    {
      user: {
        first_name: 'Firstname',
        last_name: 'Lastname',
        email: 'signuptest@stishly.com',
        password: '2f7bec2Ae71aaR90F%75f88134f437d7bb',
        password_confirmation: '2f7bec2Ae71aaR90F%75f88134f437d7bb',
        timezone: 'America/New_York',
      }
    }
  end

  context 'when user is unauthenticated' do
    before { post url, params: params }

    it 'returns 200' do
      expect(response.status).to eq 200
    end

    it 'returns a new user' do
      user = JSON.parse(response.body)
      expect(user['first_name']).to eq 'Firstname'
      expect(user['last_name']).to eq 'Lastname'
      expect(user['email']).to eq 'signuptest@stishly.com'
      expect(user['timezone']).to eq 'America/New_York'
    end

  end

  context 'when user already exists' do
    before do
      Fabricate :user, email: params[:user][:email]
      post url, params: params
    end

    it 'returns bad request status' do
      expect(response.status).to eq 400
    end

    it 'returns validation errors' do
      expect(JSON.parse(response.body)['errors'][0]['title']).to eq('Bad Request')
    end
  end

end