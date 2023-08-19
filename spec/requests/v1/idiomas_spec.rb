require 'rails_helper'

RSpec.describe '/v1/idiomas', type: :request do
  let(:valid_headers) do
    { content_type: 'application/json' }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      idioma = create_list(:idioma, 5).as_json
      get v1_idiomas_url, headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.parsed_body).to eq(idioma)
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      idioma = create(:idioma)
      get v1_idioma_url(idioma), as: :json
      expect(response).to be_successful
      expect(response.parsed_body).to eq(idioma.as_json)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new V1::Idioma' do
        idiomas_attributes = { nome: Faker::Name.name }
        expect do
          post v1_idiomas_url,
               params: { idioma: idiomas_attributes }, headers: valid_headers, as: :json
        end.to change(V1::Idioma, :count).by(1)
      end

      it 'renders a JSON response with the new v1_idioma' do
        idiomas_attributes = { nome: Faker::Name.name }
        post v1_idiomas_url,
             params: { idioma: idiomas_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new V1::Idioma' do
        expect do
          post v1_idiomas_url,
               params: { nome: nil }, as: :json
        end.to change(V1::Idioma, :count).by(0)
      end

      it 'renders a JSON response with errors for the new v1_idioma' do
        post v1_idiomas_url,
             params: { idioma: { nome: nil } }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  # describe 'POST /pessoas/{pessoa_id}/idiomas' do
  #   context 'with valid parameters' do
  #     it 'creates a new V1::Idioma' do
  #       idioma = create(:idioma)
  #       pessoa = create(:pessoa)
  #       idiomas_attributes = { id: pessoa.id }
  #       puts "idiomas_attributes = #{idiomas_attributes}"
  #       expect do
  #         post v1_pessoa_idiomas_url(idioma),
  #              params: { idioma: idiomas_attributes }, headers: valid_headers, as: :json
  #       end.to change(V1::Idioma, :count).by(1)
  #     end

  #     it 'renders a JSON response with the new v1_idioma' do
  #       idioma = create(:idioma)
  #       idiomas_attributes = { id: create(:pessoa).id }
  #       post v1_pessoa_idiomas_url(idioma),
  #            params: { idioma: idiomas_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not create a new V1::Idioma' do
  #       idioma = create(:idioma)
  #       expect do
  #         post v1_pessoa_idiomas_url(idioma),
  #              params: { id: 734_893 }, as: :json
  #       end.to change(V1::Idioma, :count).by(0)
  #     end

  #     it 'renders a JSON response with errors for the new v1_idioma' do
  #       idioma = create(:idioma)
  #       post v1_pessoa_idiomas_url(idioma),
  #            params: { idioma: { id: 348_734 } }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end
  # end
end
