require 'rails_helper'

RSpec.describe '/v1/vagas/1/candidaturas', type: :request do
  describe 'GET /ranking' do
    it 'renders a successful response' do
      create_list(:candidatura, 20)
      get v1_candida: candidaturas_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.parsed_body).not_to be_empty
    end
  end
end
