FactoryBot.define do
  factory :pessoa, class: 'V1::Pessoa' do
    nome { Faker::Name.name }
    profissao { 'Engenheiro de Software' }
    localizacao { V1::Pessoa::VALID_LOCALIZACAO.sample }
    nivel { 3 }
    distancia_maxima { [40, 45, 50, 55].sample }
    experiencia { 'Atuo como Engenheiro de Software a X anos' }
  end
end
