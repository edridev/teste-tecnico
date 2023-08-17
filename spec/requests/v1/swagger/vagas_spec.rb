require 'swagger_helper'

describe 'Teste Técnico API' do
  path '/v1/vagas' do
    post 'Creates a vaga' do
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

      response '201', 'blog created' do
        let(:blog) do
          {
            empresa: "Empresa Exemplo",
            titulo: "Engenheiro de Software",
            descricao: "Descricão da vaga de Engenheiro de Software",
            localizacao: "F",
            nivel: 4,
          }
        end
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { localizacao: 'Z' } }
        run_test!
      end
    end
  end
end
