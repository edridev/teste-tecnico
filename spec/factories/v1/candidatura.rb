FactoryBot.define do
  factory :candidatura, class: 'V1::Candidatura' do
    id_pessoa { create(:pessoa).id }
    id_vaga { create(:vaga).id }
  end
end
