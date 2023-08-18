require 'rails_helper'

RSpec.describe '/v1/vagas/:vaga_id/candidaturas', type: :request do
  let(:valid_headers) do
    { content_type: 'application/json' }
  end

  describe 'GET /ranking' do
    it 'renders a successful response' do
      vaga = create(:vaga)
      create(:candidatura, id_vaga: vaga.id)
      get v1_vaga_candidaturas_ranking_url(vaga), headers: valid_headers, as: :json
      expect(response).to be_successful
      expect(response.parsed_body).not_to be_empty
    end
  end
end
