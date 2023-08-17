require 'rails_helper'

RSpec.describe '/v1/vagas', type: :request do
  include_context 'vagas_attributes'

  let(:valid_headers) do
    { content_type: 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      vaga = create_list(:vaga, 5).as_json
      get v1_vagas_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.parsed_body).to eq(vaga)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      vaga = create(:vaga)
      get v1_vaga_url(vaga), as: :json
      expect(response).to be_successful
      expect(response.parsed_body).to eq(vaga.as_json)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new V1::Vaga' do
        expect do
          post v1_vagas_url,
               params: { vaga: valid_attributes }, headers: valid_headers, as: :json
        end.to change(V1::Vaga, :count).by(1)
      end

      it 'renders a JSON response with the new v1_vaga' do
        post v1_vagas_url,
             params: { vaga: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new V1::Vaga' do
        expect do
          post v1_vagas_url,
               params: { vaga: invalid_attributes }, as: :json
        end.to change(V1::Vaga, :count).by(0)
      end

      it 'renders a JSON response with errors for the new v1_vaga' do
        post v1_vagas_url,
             params: { vaga: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
