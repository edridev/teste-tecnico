require 'swagger_helper'

describe 'Teste Técnico API' do
  path '/v1/candidaturas' do
    post 'Creates a pessoa' do
      tags 'Pessoa'
      consumes 'application/json'
      parameter name: :blog, in: :body, schema: {
        type: :object,
        properties: {
          id_pessoa: { type: :integer },
          id_vaga: { type: :integer }
        },
        required: %w[ed_pessoa, id_vaga]
      }

      response '201', 'blog created' do
        let(:blog) do
          {
            id_pessoa: create(:pessoa).id,
            id_vaga: create(:vaga).id
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { id_pessoa: 0 } }
        run_test!
      end
    end
  end
end
