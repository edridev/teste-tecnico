FactoryBot.define do
  factory :vaga, class: 'V1::Vaga' do
    empresa { Faker::Company.name }
    titulo { 'Engenheiro de Software' }
    descricao { V1::Pessoa::VALID_LOCALIZACAO.sample }
    localizacao { 'F' }
    nivel { 5 }
  end
end
