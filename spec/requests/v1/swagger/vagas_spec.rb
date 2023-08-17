require 'swagger_helper'

describe 'Teste Técnico API' do
  path '/v1/vagas' do
    post 'Adiciona uma vaga' do
      tags 'Vagas'
      consumes 'application/json'
      parameter name: :blog, in: :body, schema: {
        type: :object,
        properties: {
          empresa: { type: :string },
          titulo: { type: :string },
          descricao: { type: :string },
          localizacao: { type: :string },
          nivel: { type: :integer }
        },
        required: %w[empresa titulo descricao localizacao nivel]
      }

      response '201', 'Vaga adicionada' do
        let(:blog) do
          {
            empresa: 'Empresa Exemplo',
            titulo: 'Engenheiro de Software',
            descricao: 'Descricão da vaga de Engenheiro de Software',
            localizacao: 'F',
            nivel: 4
          }
        end
        run_test!
      end

      response '422', 'Requisição inválida' do
        let(:blog) { { localizacao: 'Z' } }
        run_test!
      end
    end

    get 'Lista vagas' do
      tags 'Vagas'
      description 'Lista todas as vagas disponíveis'
      produces 'application/json'

      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end

      # response '200', 'Vagas encontradas' do
      #   before { create(:vaga) }

      #   include_context 'with swagger integration test'
      # end
    end
  end
end
