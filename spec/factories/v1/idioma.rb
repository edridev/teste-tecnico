FactoryBot.define do
  factory :idioma, class: 'V1::Idioma' do
    nome { Faker::Name.name }
  end
end
