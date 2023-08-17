require 'swagger_helper'

describe 'Teste Técnico API' do
  path '/v1/pessoas' do
    post 'Adiciona uma pessoa' do
      tags 'Pessoa'
      consumes 'application/json'
      parameter name: :blog, in: :body, schema: {
        type: :object,
        properties: {
          nome: { type: :string },
          profissao: { type: :string },
          localizacao: { type: :string },
          nivel: { type: :integer },
          score: { type: :integer }
        },
        required: %w[nome profissao localizacao nivel score]
      }

      response '201', 'Pessoa adicionada' do
        let(:blog) do
          {
            nome: 'Marcos Alcantara',
            profissao: 'Engenheiro de Software',
            localizacao: 'F',
            nivel: 5,
            score: 0
          }
        end
        run_test!
      end

      response '422', 'Requisição inválida' do
        let(:blog) { { localizacao: 'Z' } }
        run_test!
      end
    end
  end
end
