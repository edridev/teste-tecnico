FactoryBot.define do
  factory :lingua, class: 'V1::Lingua' do
    pessoa
    idioma
    grau { V1::Lingua::LEVEL_IDIOMAS.sample }
  end
end
