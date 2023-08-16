FactoryBot.define do
  factory :candidaturas, class: 'V1::Candidatura' do
    pessoa
    vaga
  end
end
