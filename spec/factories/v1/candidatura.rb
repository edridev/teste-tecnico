FactoryBot.define do
  factory :candidatura, class: 'V1::Candidatura' do
    trait :with_pessoa do
      id_pessoa { create(:pessoa).id }
    end
    trait :with_vaga do
      id_vaga { create(:vaga).id }
    end
    trait :full do
      id_pessoa { create(:pessoa).id }
      id_vaga { create(:vaga).id }
    end
  end
end
