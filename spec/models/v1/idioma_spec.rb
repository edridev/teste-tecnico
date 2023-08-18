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
    it 'has many linguas' do
      idioma = create(:idioma)
      3.times do
        idioma.linguas.build build(:lingua, :with_pessoa).as_json
      end
      idioma.save
      expect(idioma.linguas.count).to eq(3)
    end

    it 'has many pessoas through linguas' do
      idioma = create(:idioma)
      3.times do
        idioma.linguas.build build(:lingua, :with_idioma).as_json
      end
      idioma.save
      expect(idioma.linguas.count).to eq(idioma.pessoas.count)
    end
  end
end
