RSpec.shared_context 'pessoas_attributes' do
  let(:valid_attributes) do
    {
      nome: Faker::Name.name,
      profissao: 'Engenheiro de Software',
      localizacao: 'F',
      nivel: 4,
      distancia_maxima: [40, 45, 50, 55].sample,
      experiencia: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    }
  end

  let(:invalid_attributes) do
    {
      nome: Faker::Name.name,
      profissao: 'Engenheiro de Software',
      localizacao: 'Z',
      nivel: 4
    }
  end
  
end
