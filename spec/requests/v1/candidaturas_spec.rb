require 'rails_helper'

RSpec.describe '/v1/candidaturas', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      create(:candidatura, valid_attributes)
      get v1_candida: candidaturas_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.parsed_body).not_to be_empty
    end
  end

  describe 'POST /create' do
    before(:all) do
      valid_attributes = {
        id_pessoa: create(:pessoa).id,
        id_vaga: create(:vaga).id
      }
      post v1_candidaturas_url,
           params: { candidatura: valid_attributes }, headers: { content_type: 'application/json' }, as: :json
    end

    context 'with valid parameters' do
      it 'creates a new Candidatura' do
        expect(response.parsed_body['success']).to be true
        expect(response.parsed_body['data'].present?).to be true
      end

      it 'renders a JSON response with the new candidatura' do
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      before(:all) do
        invalid_attributes = {
          id_pessoa: create(:pessoa).id
        }
        post v1_candidaturas_url,
             params: { candidatura: invalid_attributes }, headers: { content_type: 'application/json' }, as: :json
      end

      it 'does not create a new Candidatura' do
        expect(response.parsed_body['success']).to be false
        expect(response.parsed_body['error'].present?).to be true
      end

      it 'renders a JSON response with errors for the new candidatura' do
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
