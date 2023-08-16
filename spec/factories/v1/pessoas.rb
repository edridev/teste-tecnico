FactoryBot.define do
  factory :pessoas, class: 'V1::Pessoa' do
    nome { Faker::Name.name }
    profissao { 'Engenheiro de Software' }
    localizacao { Pessoa::VALID_LOCALIZACAO.sample }
    nivel { Pessoa::VALID_NIVEL.keys.sample }
    score { Pessoa::VALID_SCORE.first }
  end
end
