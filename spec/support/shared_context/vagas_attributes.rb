RSpec.shared_context 'vagas_attributes' do

  let(:valid_attributes) do
    {
      empresa: Faker::Company.name,
      titulo: Faker::Name.name,
      descricao: Faker::Lorem.paragraph,
      localizacao: 'F',
      nivel: 5
    }
  end

  let(:invalid_attributes) do
    {
      empresa: Faker::Company.name,
      titulo: Faker::Name.name,
      descricao: Faker::Lorem.paragraph,
      localizacao: 'Z',
      nivel: 5
    }
  end

  let(:valid_headers) do
    { content_type: 'application/json' }
  end

end
