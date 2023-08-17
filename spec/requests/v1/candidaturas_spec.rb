require 'rails_helper'

RSpec.describe '/v1/candidaturas', type: :request do
  let(:valid_headers) do
    { content_type: 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      candidatura = create_list(:candidatura, 5).as_json
      get v1_candidaturas_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.parsed_body).to eq(candidatura)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      candidatura = create(:candidatura)
      get v1_candidatura_url(candidatura), as: :json
      expect(response).to be_successful
      expect(response.parsed_body).to eq(candidatura.as_json)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new V1::Candidatura' do
        candidaturas_attributes = {
          id_pessoa: create(:pessoa).id,
          id_vaga: create(:vaga).id
        }
        expect do
          post v1_candidaturas_url,
               params: { candidatura: candidaturas_attributes }, headers: valid_headers, as: :json
        end.to change(V1::Candidatura, :count).by(1)
      end

      it 'renders a JSON response with the new v1_candidatura' do
        candidaturas_attributes = {
          id_pessoa: create(:pessoa).id,
          id_vaga: create(:vaga).id
        }
        post v1_candidaturas_url,
             params: { candidatura: candidaturas_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new V1::Candidatura' do
        candidaturas_attributes = { id_pessoa: nil, id_vaga: nil }
        expect do
          post v1_candidaturas_url,
               params: candidaturas_attributes, as: :json
        end.to change(V1::Candidatura, :count).by(0)
      end

      it 'renders a JSON response with errors for the new v1_candidatura' do
        candidaturas_attributes = { id_pessoa: nil, id_vaga: nil }
        post v1_candidaturas_url,
             params: { candidatura: candidaturas_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
