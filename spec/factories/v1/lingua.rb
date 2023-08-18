FactoryBot.define do
  factory :lingua, class: 'V1::Lingua' do
    grau { V1::Lingua::LEVEL_IDIOMAS.sample }

    trait :with_pessoa do
      id_pessoa { create(:pessoa).id }
    end

    trait :with_idioma do
      id_idioma { create(:idioma).id }
    end

    trait :full do
      id_pessoa { create(:pessoa).id }
      id_idioma { create(:idioma).id }
    end
  end
end
