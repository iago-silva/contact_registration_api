# frozen_string_literal: true

require 'rails_helper'

describe 'Contacts request', type: :request do
  let(:user) { create(:user) }
  let(:user_auth_headers) { user.create_new_auth_token }

  describe '#index' do
    before do
      get api_v1_contacts_path, headers: user_auth_headers
    end

    context 'when doesn\'t pass params' do
      it 'returns ok http status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe '#create' do
    let(:cpf) { '44037438038' }
    let(:params) do
      {
        contact: {
          name: 'Marcelo',
          cpf: cpf,
          phone: '+5587988427333',
          address_attributes: {
            zipcode: '56309020',
            number: '205',
            street: '3',
            neighborhood: 'Cohab VI',
            city: 'Petrolina',
            state: 'Pernambuco',
            latitude: '23131231',
            longitude: '123123123'
          }
        }
      }
    end

    before do
      post api_v1_contacts_path, headers: user_auth_headers, params: params
    end

    context 'when pass valid params' do
      it 'returns ok http status' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when doesn\'t pass valid params' do
      let(:cpf) { '4403743803' }

      it 'returns unprocessable_entity http status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
