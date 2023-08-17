require 'swagger_helper'

describe 'Teste Técnico API' do
  path '/v1/candidaturas' do
    post 'Adiciona uma candidatura' do
      tags 'Candidatura'
      
      response(200, 'successful') do
        consumes 'application/json'
        parameter name: :candidatura, in: :body, schema: {
          type: :object,
          properties: {
            id_pessoa: { type: :integer },
            id_vaga: { type: :integer }
          },
          required: %w[id_pessoa id_vaga]
        }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      # response '422', 'Requisição inválida' do
      #   let(:candidatura) { { id_pessoa: 0 } }
      #   run_test!
      # end
    end
  end
end
