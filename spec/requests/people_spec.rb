require 'rails_helper'

RSpec.describe '/people', type: :request do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end
  let(:valid_headers) do
    {}
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Person' do
        expect do
          post people_url,
               params: { person: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Person, :count).by(1)
      end

      it 'renders a JSON response with the new person' do
        post people_url,
             params: { person: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Person' do
        expect do
          post people_url,
               params: { person: invalid_attributes }, as: :json
        end.to change(Person, :count).by(0)
      end

      it 'renders a JSON response with errors for the new person' do
        post people_url,
             params: { person: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end
end
