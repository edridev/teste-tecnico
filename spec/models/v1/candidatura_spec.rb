require 'rails_helper'

RSpec.describe V1::Candidatura, type: :model do
  subject { build(:candidatura) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a id_pessoa' do
      subject.id_pessoa = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a id_vaga' do
      subject.id_vaga = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with duplicate id_pessoa/id_vaga' do
      create(:candidatura, id_pessoa: subject.id_pessoa, id_vaga: subject.id_vaga)
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to pessoa' do
      expect(subject.respond_to?(:pessoa)).to be true
      pessoa = create(:pessoa)
      cand = create(:candidatura, id_pessoa: pessoa.id, id_vaga: create(:vaga).id)
      expect(cand.pessoa).to eq(pessoa)
    end

    it 'belongs to vaga' do
      expect(subject.respond_to?(:vaga)).to be true
      vaga = create(:vaga)
      cand = create(:candidatura, id_vaga: vaga.id, id_pessoa: create(:pessoa).id)
      expect(cand.vaga).to eq(vaga)
    end
  end
end
