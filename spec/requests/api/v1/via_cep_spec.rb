# frozen_string_literal: true

require 'rails_helper'

describe 'ViaCep request', type: :request do
  let(:user) { create(:user) }
  let(:user_auth_headers) { user.create_new_auth_token }

  context 'when pass valid cep' do
    let(:cep) { '56309020' }

    before do
      get "/api/v1/via_cep/#{cep}", headers: user_auth_headers
    end

    it 'returns ok http status' do
      expect(response).to have_http_status(:ok)
    end
  end

  context 'when pass invalid cep' do
    let(:cep) { '5630902' }

    before do
      get "/api/v1/via_cep/#{cep}", headers: user_auth_headers
    end

    it 'returns ok http status' do
      expect(response).to have_http_status(:bad_request)
    end
  end
end
