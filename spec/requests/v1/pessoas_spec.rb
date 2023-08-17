require 'rails_helper'

RSpec.describe '/v1/pessoas', type: :request do
  include_context 'pessoas_attributes'

  let(:valid_headers) do
    { content_type: 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      pessoa = create_list(:pessoa, 5).as_json
      get v1_pessoas_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.parsed_body).to eq(pessoa)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      pessoa = create(:pessoa)
      get v1_pessoa_url(pessoa), as: :json
      expect(response).to be_successful
      expect(response.parsed_body).to eq(pessoa.as_json)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new V1::Pessoa' do
        expect do
          post v1_pessoas_url,
               params: { pessoa: valid_attributes }, headers: valid_headers, as: :json
        end.to change(V1::Pessoa, :count).by(1)
      end

      it 'renders a JSON response with the new v1_pessoa' do
        post v1_pessoas_url,
             params: { pessoa: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new V1::Pessoa' do
        expect do
          post v1_pessoas_url,
               params: { pessoa: invalid_attributes }, as: :json
        end.to change(V1::Pessoa, :count).by(0)
      end

      it 'renders a JSON response with errors for the new v1_pessoa' do
        post v1_pessoas_url,
             params: { pessoa: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
