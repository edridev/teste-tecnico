FactoryBot.define do
  factory :pessoa, class: 'V1::Pessoa' do
    nome { Faker::Name.name }
    profissao { 'Engenheiro de Software' }
    localizacao { V1::Pessoa::VALID_LOCALIZACAO.sample }
    nivel { 3 }
    score { 0 }
  end
end
