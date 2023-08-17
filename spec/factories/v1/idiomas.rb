FactoryBot.define do
  factory :idioma, class: 'V1::Idioma' do
    nome { ['Inglês','Português','Francês','Mandarim','Espanhol','Alemão'].sample }
  end
end
