FactoryBot.define do
  factory :vagas, class: 'V1::Vaga' do
    empresa { Faker::Company.name }
    titulo { 'Engenheiro de Software' }
    descricao { 'Vagas abertas para Engenheiro de Software' }
    localizacao { 'F' }
    nivel { 'sênior' }
  end
end
