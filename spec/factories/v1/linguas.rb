FactoryBot.define do
  factory :lingua do
    pessoa
    idioma
    grau { 'MyString' }
  end
end
