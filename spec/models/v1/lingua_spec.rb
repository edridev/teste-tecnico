require 'rails_helper'

RSpec.describe V1::Lingua, type: :model do
  subject { build(:lingua, :full) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a id_pessoa' do
      subject.id_pessoa = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a id_idioma' do
      subject.id_idioma = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a grau' do
      subject.grau = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with duplicate id_pessoa/id_idioma' do
      create(:lingua, id_pessoa: subject.id_pessoa, id_idioma: subject.id_idioma)
      expect(subject).to_not be_valid
    end

    it 'is invalid when grau is not in list' do
      subject.grau = 'kdjdf'
      expect(subject).to_not be_valid
      subject.grau = 'Intermediario'
      expect(subject).to be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:pessoa).with_foreign_key('id_pessoa') }
    it { should belong_to(:idioma).with_foreign_key('id_idioma') }
  end
end
