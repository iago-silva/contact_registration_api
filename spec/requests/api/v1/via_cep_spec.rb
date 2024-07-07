require "rails_helper"

describe 'ViaCep request', type: :request do  
  context 'when pass' do  
    before do
      get api_v1_path('56309020'), headers: {  }
    end

    it 'cannot have comments' do 
      expect(response).to have_http_status(:ok)
    end
  end
end
