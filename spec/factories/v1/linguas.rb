FactoryBot.define do
  factory :lingua do
    pessoa
    idioma
    grau { V1::Lingua::LEVEL_IDIOMAS.sample }
  end
end
