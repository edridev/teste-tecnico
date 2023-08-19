require 'rails_helper'

RSpec.describe V1::Idioma, type: :model do
  subject { build(:idioma) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a nome' do
      subject.nome = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with duplicate nome' do
      create(:idioma, nome: subject.nome)
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has and belongs to many pessoas' do
      idioma = create(:idioma)
      expect(idioma.pessoas.count).to eq(0)
      idioma.pessoas << create_list(:pessoa, 3)
      expect(idioma.pessoas.count).to eq(3)
    end
  end
end
