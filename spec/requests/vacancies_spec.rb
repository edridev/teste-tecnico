require 'rails_helper'

RSpec.describe "/vacancies", type: :request do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_headers) {
    {}
  }

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Vacancy" do
        expect {
          post vacancies_url,
               params: { vacancy: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Vacancy, :count).by(1)
      end

      it "renders a JSON response with the new vacancy" do
        post vacancies_url,
             params: { vacancy: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Vacancy" do
        expect {
          post vacancies_url,
               params: { vacancy: invalid_attributes }, as: :json
        }.to change(Vacancy, :count).by(0)
      end

      it "renders a JSON response with errors for the new vacancy" do
        post vacancies_url,
             params: { vacancy: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end
end
