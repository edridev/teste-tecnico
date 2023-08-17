RSpec.shared_context 'pessoas_attributes' do
  let(:valid_attributes) do
    {
      nome: Faker::Name.name,
      profissao: 'Engenheiro de Software',
      localizacao: 'F',
      nivel: 4,
      score: 0
    }
  end

  let(:invalid_attributes) do
    {
      nome: Faker::Name.name,
      profissao: 'Engenheiro de Software',
      localizacao: 'Z',
      nivel: 4,
      score: 0
    }
  end

  let(:valid_headers) do
    { content_type: 'application/json' }
  end
  
end
