require 'rails_helper'

RSpec.describe "Logins", type: :request do
  describe "POST /login" do
    let(:user) { Fabricate(:user) }
    let(:url) { '/login' }
    let(:params) do
      {
        user: {
          email: user.email,
          password: user.password
        }
      }
    end

    context 'when params are correct' do
      before do
        post url, params: params
      end

      it 'returns 200' do
        expect(response).to have_http_status(200)
      end
    end

  end
end
