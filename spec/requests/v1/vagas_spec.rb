require 'rails_helper'

RSpec.describe '/v1/vagas', type: :request do
  include_context 'vagas_attributes'

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Vagas' do
        post v1_vagas_url,
             params: { vaga: valid_attributes }, headers: valid_headers,  as: :json
        expect(response.parsed_body['success']).to be true
        expect(response.parsed_body['data'].present?).to be true
      end

      it 'renders a JSON response with the new Vaga' do
        post v1_vagas_url,
             params: { vaga: valid_attributes }, headers: valid_headers,  as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Vagas' do
        post v1_vagas_url,
             params: { vaga: invalid_attributes }, headers: valid_headers, as: :json
        expect(response.parsed_body['success']).to be false
        expect(response.parsed_body['error'].present?).to be true
      end

      it 'renders a JSON response with errors for the new Vaga' do
        post v1_vagas_url,
             params: { vaga: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
