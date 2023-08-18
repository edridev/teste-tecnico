require 'rails_helper'

RSpec.describe V1::Vaga, type: :model do
  subject { build(:vaga) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a empresa' do
      subject.empresa = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a tilulo' do
      subject.titulo = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a descricao' do
      subject.descricao = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a localizacao' do
      subject.localizacao = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a nivel' do
      subject.nivel = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a nivel' do
      subject.nivel = nil
      expect(subject).to_not be_valid
    end

    it 'if invalid when nivel is out of range(1..5)' do
      subject.nivel = 6
      expect(subject).to_not be_valid
    end

    it 'if invalid when localizacao is out of range(1..5)' do
      subject.localizacao = 'Z'
      expect(subject).to_not be_valid
    end

    it 'is not valid with duplicate empresa/titulo' do
      create(:vaga, empresa: subject.empresa, titulo: subject.titulo)
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it 'has many candidaturas' do
      vaga = create(:vaga)
      3.times do
        jrow = build(:candidatura, id_vaga: nil).as_json.compact
        vaga.candidaturas.create(jrow)
      end
      expect(vaga.candidaturas.count).to eq(3)
    end

    it 'has many pessoas through candidaturas' do
      vaga = create(:vaga)
      3.times do
        jrow = build(:candidatura, id_vaga: nil).as_json.compact
        vaga.candidaturas.create(jrow)
      end
      expect(vaga.candidaturas.count).to eq(vaga.pessoas.count)
    end
  end
end
