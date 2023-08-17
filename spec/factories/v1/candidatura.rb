FactoryBot.define do
  factory :candidatura, class: 'V1::Candidatura' do
    pessoa
    vaga
  end
end
